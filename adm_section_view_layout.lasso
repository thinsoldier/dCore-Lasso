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

	local:'dCoreFoundSet' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'section_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $sectnum)))),(array:'id','category_name','category_approved')));

	iterate: #dCoreFoundSet->get:3, local:'dCoreFoundSetRecord';
		var:'sortInfo' = (var:'sortOrder' + '@@' + (#dCoreFoundSetRecord->get:1))->(split:'@@');
		var:'sortRecord' = ($sortInfo->get:1);
		var:'sortPosition' = ($sortInfo->get:2);
		local: 'dCoreUpdateSort' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array:(pair:'category_menu_position'=$sortPosition)),(array: (pair:'='=(pair:'id'=$sortRecord)))));
	/iterate;
/if;


local:'dCoreCategories' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'section_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $sectnum)))),(array:'id','category_name','category_approved'),(pair:'category_menu_position'='ASC')));

'<table border="0" width="100%">';
'<tr>';
'<td valign=Top>';
'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Green:'Section Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreSections->get:3->get:1->get:2) + '</td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Grey:'Section Text',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff">';(dCoreAPI_textMode:(#dCoreSections->get:3->get:1->get:5),(#dCoreSections->get:3->get:1->get:8));'</td>';
		'</tr>';
			
		'</table>';
	'</td>';
	
	
	
	'</tr>';
	
	
	'<tr valign="top">';
	'<FORM ACTION="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avs')+'&sectnum=' + $sectNum + '" METHOD="POST">';
	'<input type="hidden" name="orderpages" value="1">';
	'<td valign="top" width="746" colspan="2"  >';
		dCoreModTag_hd746Grey:'Categories',-encodenone;
		if: #dCoreCategories->get:2 > 0;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#cccccc" width="10"><b>Sort</b></td>';
				'<td bgcolor="#cccccc"><b>Category</b></td>';
				'<td bgcolor="#cccccc" align="center"><b>Status</b></td>';
				'</tr>';
				iterate: #dCoreCategories->get:3, local:'dCoreCategoryRecord';
					local:'sortPosition' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(#dCoreCategoryRecord->get:1)))),(array:'id','category_menu_position')));
					local:'dCoreFoundSetCount' = loop_count;
					'<tr valign="top">';
					'<td bgcolor="#ffffff" align="center" width="10">';
					'<select name="sortOrder' + '@@' + (#dCoreCategoryRecord->get:1) + '">';
						loop:(#dCoreCategories->get:3)->size;
							'<option value="';
							(#dCoreCategoryRecord->get:1) + '@@' + loop_count;
							
							'"';
							if: loop_count == (#sortPosition->get:3->get:1->get:2);
								' selected';
							/if;
							'>';
							loop_count;
						/loop;
					'</select>';
					'</td>';
					'<td bgcolor="#ffffff"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avcat') + '&catnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreCategoryRecord->get:1)+'" class="body">' + #dCoreCategoryRecord->get:2 + '</a></td>';
					'<td bgcolor="#ffffff" align="center">' + (dCoreAPI_switchOnOff->tickCross:(#dCoreCategoryRecord->get:3)) + '</td>';
					'</tr>';
				/iterate;
			'</table>';
		/if;
		if: (#dCoreCategories->get:3->get:1->get:1) != '';
			'<p><INPUT TYPE="SUBMIT" VALUE="Sort Order"></p>';
		/if;
	'</form>';		
	'</td>';
	
	'</tr>';		
	
	if: (var:'tmplnum') != '';
		local:'tempSettings' = (var:'tmplnum')->(split:'.lassoapp')->(get:1);
	
	else: (#dCoreSections->get:3->get:1->get:4) != '';
		local:'tempSettings' = (#dCoreSections->get:3->get:1->get:4);
	/if;
	if: lassoapp_list->(find: #tempSettings)->size > 0;
		if: dCoreAPI_runTag->infoImg:(#tempSettings)->size > 0;
		
			'<tr valign="top">';
			'<td valign="top" width="746" colspan="2">';
				dCoreModTag_hd746Grey:'Section Image',-encodenone;
				'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				
				'<tr valign="top">';
					'<td bgcolor="#ffffff" valign="middle" align="center"><b>Template Settings</b></td>';
					'<td bgcolor="#ffffff" valign="middle" align="center"><b>Thumbnail</b></td>';
					
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="#ffffff" valign="middle" align="center">';
					if: (var:'tmplnum') != '';
						local:'tempSettings' = (var:'tmplnum')->(split:'.lassoapp')->(get:1);
					else: (#dCoreSections->get:3->get:1->get:4) != '';
						local:'tempSettings' = (#dCoreSections->get:3->get:1->get:4);
					/if;
					if: (#tempSettings) != '';
						'<b>Image</b> : 'dCoreAPI_runTag->infoImg:(#tempSettings)->get:1->first;
						'<br><br>';
						'<b>Size WxH </b><br>' + dCoreAPI_runTag->infoImg:(#tempSettings)->get:1->second;
					/if;
					'</td>';
					
					'<td bgcolor="#ffffff" valign="middle" align="center">';
					'<img src="';
					if:(#dCoreSections->get:3->get:1->get:11) !='';
						(dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#dCoreSections->get:3->get:1->get:11);
					else;
						'dCoreIMG_core/xx.gif';
					/if;
					'" name="con_imgs" border="0">';
					'</td>';
				'</tr>';
				'</table>';
				
			'</td>';
			
			'</tr>';
		/if;
	/if;
	
'</table>';
'</td>'
'<td valign=top>';
'<table border="0" width="746">';
	
	
	'<tr>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Tasks',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			if: (#dCoreSections->get:3->get:1->get:6) > 0;
				'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Accat') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreSections->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_add.gif" border="0" width=15></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Accat') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreSections->get:3->get:1->get:1)+'" class="body">Add Cat.</a></td>';
			/if;
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aes') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreSections->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0" width=15></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aes') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreSections->get:3->get:1->get:1)+'" class="body">Edit Sect.</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ads') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreSections->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_delete.gif" border="0" width=15></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ads') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreSections->get:3->get:1->get:1)+'" class="body">Del Sect.</a></td>';
		'</tr>';
		'</table>';
		
	'</td>';
	'</tr>';
	'<tr>';
	'<td valign="top">';
	dCoreModTag_hd241Grey:'Section Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			(dCoreAPI_switchOnOff->tickCross:(#dCoreSections->get:3->get:1->get:3));
			'</td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Text Mode:</b></td>';
				'<td bgcolor="white" align="center">';
				string_uppercase:(#dCoreSections->get:3->get:1->get:8);
				'</td>';
				
			'</tr>';
			
			/*
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Sub Levels:</b></td>';
				'<td bgcolor="white" align="center">';
				(#dCoreSections->get:3->get:1->get:6);
				'</td>';
			*/	
			'</tr>';
		
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Homepage Listing:</b></td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreSections->get:3->get:1->get:16));
				'</td>';
				
			'</tr>';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Child Access:</b></td>';
				'<td bgcolor="white" align="center">';
				if:(#dCoreSections->get:3->get:1->get:17) =='1';
					'<img src="dCoreIMG_core/icon_cross.gif" border="0">';
				else;
					'<img src="dCoreIMG_core/icon_tick.gif" border="0">';
				/if;
				
				'</td>';
				
			'</tr>';
			
		'</table>';
		'</td>';
		'</tr>';
		'<tr valign="top">';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Permissions',-encodenone;
		
			'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
					'<td bgcolor="#ffffff"><b>User Group</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>R</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>W</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>E</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>D</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>U</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>M</b></td>';
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="#ffffff"><b>Public</b></td>';
					'<td bgcolor="#ffffff" align="center">';
					(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: ('_0')->size);
					'</td>';
					'<td bgcolor="#ffffff" align="center">';
					(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->write:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: ('_0')->size);
					'</td>';
					'<td bgcolor="#ffffff" align="center">';
					(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->edit:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: ('_0')->size);
					'</td>';
					'<td bgcolor="#ffffff" align="center">';
					(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->delete:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: ('_0')->size);
					'</td>';
					'<td bgcolor="#ffffff" align="center">';
					(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: ('_0')->size);
					'</td>';
					'<td bgcolor="#ffffff" align="center">';
					(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->moderator:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: ('_0')->size);
					'</td>';
				'</tr>';
				
				iterate: dCoreModTag_core_userGroups->getAll, local:'getAllItem';
					if: #getAllItem->get:2 != 'Administrator';
						'<tr valign="top">';
							'<td bgcolor="#ffffff"><b>' + #getAllItem->get:2 + '</b></td>';
							'<td bgcolor="#ffffff" align="center">';
							(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size);
							'</td>';
							'<td bgcolor="#ffffff" align="center">';
							(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->write:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size);
							'</td>';
							'<td bgcolor="#ffffff" align="center">';
							(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->edit:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size);
							'</td>';
							'<td bgcolor="#ffffff" align="center">';
							(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->delete:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size);
							'</td>';
							'<td bgcolor="#ffffff" align="center">';
							(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size);
							'</td>';
							'<td bgcolor="#ffffff" align="center">';
							(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_sections->moderator:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size);
							'</td>';
						'</tr>';
					/if;
					
				/iterate;
				
			'</table>';
			
	'</td>';
	
	'</tr>';
	'<tr>';
	'<td valign="top" width="241">';
	dCoreModTag_hd241Grey:'Template Appearance',-encodenone;
		'<table>';
			'<tr valign="top">';
				'<td align="center"><img src="';
				local:'stringTmpl' = (#dCoreSections->get:3->get:1->get:4)->(split:'_');
					(#dCoreSections->get:3->get:1->get:4)+ '.lassoapp?-responselassoapp=' + 'dCoreTmpl_section_img_' + (#stringTmpl->get:3) + '.gif';
					
				'" border="0"></td>';
				
			'</tr>';
	'</table>';
	'</td>';
	'</tr>';	
	'</table>';
	
	
	
?>

