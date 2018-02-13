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



// search 

local:'searchSections' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'section_approved'='1'))),(array:'id','section_title')));


if: $pg != 'admarea';
'<table border="0"  cellpadding="0" cellspacing="0" width="100%">';
'<tr>';

'<td align="center">';
'<table border="0" cellpadding="1" cellspacing="1" width="100%">';
'<tr align="center">';
'<td bgcolor="#000000" valign="middle" align="center">';
	'<table border="0" cellpadding="0" cellspacing="1" bgcolor="#ffffff" width="100%">';
	'<tr align="center">';
		
	// quick menu
		'<td valign="top">';
			
		'</td>';
		'<td valign="top" width="241">';
				dCoreModTag_hd241Blue:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'usrarea')+'" class="title">Users</a>',-encodenone;
		'</td>';
	
		'<td valign="top" width="241">';
			dCoreModTag_hd241Green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" class="title">Content</a>',-encodenone;
		'</td>';
	
		'<td valign="top" width="241">';
			dCoreModTag_hd241Orange:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'filearea')+'" class="title">Files</a>',-encodenone;
		'</td>';
		
	
	/*
		if: $adminArea != 'statistic';
			'<td valign="top" width="241">';
				dCoreModTag_hd241Purple:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'statsarea')+'" class="title">Statistics</a>',-encodenone;
			'</td>';
		/if;
			
	*/	
		'<form action="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Asearchr')+'" method="post">';
		'<td align="left">';
		'&nbsp;';
		'&nbsp;';
		'<select name="keyword_section">';
		'<option value="';
		(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),'0');
		'">Site';
		if: (#searchSections->get:2) > 0;
			iterate: (#searchSections->get:3), local:'searchSectionsItem';
			
			'<option value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#searchSectionsItem->get:1)) + '"';
				if: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'keyword_section')) == (#searchSectionsItem->get:1);
					' selected';
				/if;
			'>';
			(#searchSectionsItem->get:2);
			/iterate;
		/if;
		'</select>';
		'<input type="text" size="15" name="keyword" value="' + (var:'keyword') + '">';
		'<input type="submit" value="Go">';
		'</td>';
		'</form>';

	'</tr>';
	'</table>';
	'</td></tr></table>';
	'</td></tr></table>';
/if;
?>
				