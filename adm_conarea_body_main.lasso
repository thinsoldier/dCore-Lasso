<?lassoscript
/*#######################################################################
#									#
#	Application: 	dCore						#
#	Version: 	1.9						#
#	Author: 	Duncan Cameron					#
#									#
#									#
#	Date: July 2004							#
#									#
#########################################################################
#    License LGPL							#
#########################################################################
#    Copyright (C) 2004,2005  Duncan Cameron				#
#									#
#    This library is free software; you can redistribute it and/or	#
#    modify it under the terms of the GNU Lesser General Public		#
#    License as published by the Free Software Foundation; either	#
#    version 2.1 of the License, or (at your option) any later version.	#
#									#
#    This library is distributed in the hope that it will be useful,	#
#    but WITHOUT ANY WARRANTY; without even the implied warranty of	#
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU	#
#    Lesser General Public License for more details.			#
#									#
#    You should have received a copy of the GNU Lesser General Public	#
#    License along with this library; if not, write to the Free Software#
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  		#
#    02111-1307  USA 							#
#									#
#									#
#########################################################################
#									#
#			-----  SOURCE BELOW  -----			#
#									#
#######################################################################*/



if: (var:'orderpages') == '1';

local:'dCoreFoundSet' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'>'=(pair:'id'=0))),(array:'id')));

	iterate: #dCoreFoundSet->get:3, local:'dCoreFoundSetRecord';
		var:'sortInfo' = (var:'sortOrder' + '@@' + (#dCoreFoundSetRecord->get:1))->(split:'@@');
		var:'sortRecord' = ($sortInfo->get:1);
		var:'sortPosition' = ($sortInfo->get:2);
		local: 'dCoreUpdateSort' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array:(pair:'section_menu_position'=$sortPosition)),(array: (pair:'='=(pair:'id'=$sortRecord)))));
				
	/iterate;
/if;

local:'dCoreFoundSet' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_sections->setFields)->second,(pair:'section_menu_position'='ASC')));

'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<FORM ACTION="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" METHOD="POST">';
	'<input type="hidden" name="orderpages" value="1">';
		'<td valign="top" width="746">';
		dCoreModTag_hd746Green:'Sections',-encodenone;
		if: #dCoreFoundSet->get:2 > 0;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff" width="10"><b>Sort</b></td>';
				'<td bgcolor="#ffffff"><b>Section</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Categories</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Status</b></td>';
				'</tr>';
			
				iterate: #dCoreFoundSet->get:3, local:'dCoreFoundSetRecord';
					if: $sess_sectionModerator->find:(#dCoreFoundSetRecord->get:1)->size > 0;
						local:'dCoreFoundSetCount' = loop_count;
						local:'sortPosition' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'id'=(#dCoreFoundSetRecord->get:1)))),(array:'id','section_menu_position')));
		
						'<tr valign="top">';
						'<td bgcolor="#ffffff" align="center" width="10">';
						'<select name="sortOrder' + '@@' + (#dCoreFoundSetRecord->get:1) + '">';
							loop:(#dCoreFoundSet->get:3)->size;
								'<option value="';
								(#dCoreFoundSetRecord->get:1) + '@@' + loop_count;
								
								'"';
								if: loop_count == (#sortPosition->get:3->get:1->get:2);
									' selected';
								/if;
								'>';
								loop_count;
							/loop;
						'</select>';
						'</td>';
						
						'<td bgcolor="#ffffff"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avs') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSetRecord->get:1)+'" class="body">' + #dCoreFoundSetRecord->get:2 + '</a></td>';
						'<td bgcolor="#ffffff" align="center">' + (dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'section_id'=(#dCoreFoundSetRecord->get:1)))),(dCoreModTag_core_userGroups->setFields)->second))->get:2 + '</td>';
						'<td bgcolor="#ffffff" align="center">' + (dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetRecord->get:3)) + '</td>';
						'</tr>';
					/if;
				/iterate;
			'</table>';
		/if;
		if: (#dCoreFoundSet->get:3->get:1->get:1) != '';
			'<p><INPUT TYPE="SUBMIT" VALUE="Sort Order"></p>';
		/if;
	'</form>';	
	'</td>';
	'<td valign="top" width="241" rowspan="3">';
		dCoreModTag_hd241green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acs')+'">Create Section</a>',-encodenone;
		dCoreModTag_hd241Grey:'Approval',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;</td>';
		'<td bgcolor="#ffffff" align="center"><img src="dCoreIMG_core/icon_tick.gif" border="0"></td>';
		'<td bgcolor="#ffffff" align="center"><img src="dCoreIMG_core/icon_cross.gif" border="0"></td>';
		'</tr>';
		
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Sections:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'section_approved'=1))),(dCoreModTag_core_sections->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'section_approved'=1))),(dCoreModTag_core_sections->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Categories:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'category_approved'=1))),(dcoremodtag_core_categories->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'category_approved'=1))),(dcoremodtag_core_categories->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Pages:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'content_approved'=1))),(dcoremodtag_core_content->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'content_approved'=1))),(dcoremodtag_core_content->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'</table>';
	'</td>';
	'</tr>';
'</table>';
?>

