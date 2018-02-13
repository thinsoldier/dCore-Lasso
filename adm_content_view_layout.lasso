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

'<table border="0" width="100%">';
	
	'<tr valign="top">';
	'<td valign="top" width="746">';



'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Green:'Content Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreContent->get:3->get:1->get:2) + '</td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
	if: ((dCoreAPI_runTag->infoMode:(#dCoreContent->get:3->get:1->get:6))->(find:'HTML')->size > 0) || ((dCoreAPI_runTag->infoMode:(#dCoreContent->get:3->get:1->get:6))->(find:'LDML')->size > 0);
		dCoreModTag_hd746Grey:'Plain Text Intro',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff" class="body">';(#dCoreContent->get:3->get:1->get:14);'</td>';
		'</tr>';
			
		'</table>';
		dCoreModTag_hd746Grey:'Content HTML',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff" class="body">';(dCoreAPI_textMode:(#dCoreContent->get:3->get:1->get:7), (#dCoreContent->get:3->get:1->get:10));'</td>';
		'</tr>';
			
		'</table>';
	
	
	else;
		dCoreModTag_hd746Grey:'Content Text',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff" class="body">';(dCoreAPI_textMode:(#dCoreContent->get:3->get:1->get:7), (#dCoreContent->get:3->get:1->get:10));'</td>';
		'</tr>';
			
		'</table>';
	/if;
	
	'</td>';
	
	
	
	'</tr>';
	
	
	if: (var:'tmplnum') != '';
		local:'tempSettings' = (var:'tmplnum')->(split:'.lassoapp')->(get:1);
	
	else: (#dCoreContent->get:3->get:1->get:6) != '';
		local:'tempSettings' = (#dCoreContent->get:3->get:1->get:6);
	/if;
	local:'imgPos' = (array:'18','21','22','23','24');		
	if: dCoreAPI_runTag->infoImg:(#tempSettings)->size > 0;		
	iterate: dCoreAPI_runTag->infoImg:(#tempSettings),local:'grabImgInfo';
	'<tr valign="top">';
	'<td valign="top" width="746" >';
		dCoreModTag_hd746Grey:'Content Image',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		
		'<tr valign="top">';
		
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Template Settings</b></td>';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Thumbnail</b></td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#ffffff" valign="middle" align="center">';
			
			if: (#tempSettings) != '';
				'<b>Image</b> : 'dCoreAPI_runTag->infoImg:(#tempSettings)->get:(loop_count)->first;
				'<br><br>';
				'<b>Size WxH </b><br>' + dCoreAPI_runTag->infoImg:(#tempSettings)->get:(loop_count)->second;
			/if;
			
			'</td>';
			
			'<td bgcolor="#ffffff" valign="middle" align="center">';
			'<img src="';
			if:(#dCoreContent->get:3->get:1->get:(#imgPos->get:(loop_count))) !='';
				(dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#dCoreContent->get:3->get:1->get:(#imgPos->get:(loop_count)));
			else;
				'dCoreIMG_core/xx.gif';
			/if;
			'" name="con_imgs" border="0">';
			'</td>';
			
		'</tr>';
		'</table>';
		
	'</td>';
	
	'</tr>';
	/iterate;
	/if;
	
	if: (dCoreAPI_runTag->infoFile:(#tempSettings))->size > 0;
		'<tr>';
		'<td valign="top" width="746" colspan="2" >';
			dCoreModTag_hd746Grey:'Content File',-encodenone;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
			
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>File Limitations</b></td>';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>File</b></td>';
				'</tr>';
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="center">';
				
					'<b>Types</b> : ' + dCoreAPI_runTag->infoFile:(#tempSettings)->get:1->second->split:'='->(get:1);
					'<br><br>';
					'<b>Max Size</b><br>' + dCoreAPI_runTag->infoFile:(#tempSettings)->get:1->second->split:'='->(get:2) + ' bytes';
				
				
				'</td>';
				
				'<td bgcolor="#ffffff" valign="middle" align="center">';
				'<select name="fileOne">';
				'<option value="">Select File';
				iterate: dCoreAPI_appFile, local:'appFileItem';
					if: #appFileItem->get:1 != '';
						local:'appFileLimitsType' = dCoreAPI_runTag->infoFile:(#tempSettings)->get:1->second->(split:'=')->(get:1)->(split:' ');
						local:'appFileLimitsSize' = dCoreAPI_runTag->infoFile:(#tempSettings)->get:1->second->(split:'=')->(get:2);
	
						if: ((#appFileLimitsType->find:((#appFileItem->get:2->split:'.')->(get:2)))->size > 0) && ((#appFileItem->get:4) <= (#appFileLimitsType));
							'<option value="'+ (#appFileItem->get:1) + '"';
							if: (#dCoreContent->get:3->get:1->get:19) == (#appFileItem->get:1);
								' selected';
							/if;
							'>';(#appFileItem->get:2);
						/if;
					/if;
				/iterate;
				'</select>';
				'</td>';
				
				 
					
			'</tr>';
			'</table>';
			
		'</td>';
		
		'</tr>';
	/if;	
	
	if: (dCoreAPI_runTag->infoLink:(#tempSettings)) > 0;
	'<tr valign="top">';
		'<td valign="top" width="746" colspan="2" >';
			dCoreModTag_hd746Grey:'Content Link',-encodenone;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
			
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="left"><b>Link URL</b></td>';
				'<td bgcolor="#ffffff" valign="middle" align="left"><b>Link Text</b></td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="left">' + (#dCoreContentLink->get:3->get:1->get:3) + '</td>';
				'<td bgcolor="#ffffff" valign="middle" align="left"><a href="' + (#dCoreContentLink->get:3->get:1->get:3) + '" target="_blank" class="body">' + (#dCoreContentLink->get:3->get:1->get:4) + '</a></td>';
				
			'</tr>';
			
			'</table>';
			
		'</td>';
		
		'</tr>';
	
	/if;	
	
		
'</table>';
'</td>';
'<td valign=top>';

'<table border="0" width="241">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';

	'<tr>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Tasks',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Accon') + '&catnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:5)+'" class="body"><img src="dCoreIMG_core/icon_content_add.gif" border="0" width=15></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Accon') + '&catnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:5)+'" class="body">Add Con.</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aecon') + '&connum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0" width=15></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aecon') + '&connum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:1)+'" class="body">Edit Con.</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adcon') + '&connum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_delete.gif" border="0" width=15></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adcon') + '&connum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:1)+'" class="body">Del Con.</a></td>';
					
		'</tr>';
		'</table>';
	'</td>';
	'</tr>';
	'<tr>';
	'<td valign="top">';
	dCoreModTag_hd241Grey:'Content Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			(dCoreAPI_switchOnOff->tickCross:(#dCoreContent->get:3->get:1->get:3));
			'</td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Search:</b></td>';
				'<td bgcolor="white" align="center" width="90">';
				if:(#dCoreContent->get:3->get:1->get:29) =='1';
					'<img src="dCoreIMG_core/icon_cross.gif" border="0">';
				else;
					'<img src="dCoreIMG_core/icon_tick.gif" border="0">';
				/if;
				'</td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Section:</b></td>';
				'<td bgcolor="white" align="center" width="90">';
				'<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avs') + '&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:4)+'" class="body">';
				dcoremodtag_core_sections->getTitle:(#dCoreContent->get:3->get:1->get:4)->get:1;
				'</a></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Category:</b></td>';
				'<td bgcolor="white" align="center" width="90">';
				'<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avcat') + '&catnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContent->get:3->get:1->get:5)+'" class="body">';
				dcoremodtag_core_categories->getTitle:(#dCoreContent->get:3->get:1->get:5)->get:1;
				'</a></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Text Mode:</b></td>';
				'<td bgcolor="white" align="center">';
				string_uppercase:(#dCoreContent->get:3->get:1->get:10);
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Homepage Listing:</b></td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreContent->get:3->get:1->get:20));
				'</td>';
				
			'</tr>';
			
		
		'</table>';
		'</td>';
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="241" >';
		dCoreModTag_hd241Grey:'Permissions',-encodenone;
		
			'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
					'<td bgcolor="#ffffff"><b>User Group</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>R</b></td>';
					'</tr>';
					'<tr valign="top">';
						'<td bgcolor="#ffffff"><b>Public</b></td>';
						'<td bgcolor="#ffffff" align="center">';
						(dCoreAPI_switchOnOff->tickCross:(#dCoreContent->get:3->get:1->get:8)->(split:',')->find: ('_0')->size);
						'</td>';
				
				'</tr>';
				iterate: dCoreModTag_core_userGroups->getAll, local:'getAllItem';
				if: #getAllItem->get:2 != 'Administrator';
					'<tr valign="top">';
						'<td bgcolor="#ffffff"><b>' + #getAllItem->get:2 + '</b></td>';
						'<td bgcolor="#ffffff" align="center">';
						(dCoreAPI_switchOnOff->tickCross:(#dCoreContent->get:3->get:1->get:8)->(split:',')->find: (#getAllItem->get:1)->size);
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
				local:'stringTmpl' = (#dCoreContent->get:3->get:1->get:6)->(split:'_');						
				
				(#dCoreContent->get:3->get:1->get:6)+ '.lassoapp?-responselassoapp=' + 'dCoreTmpl_content_img_' + (#stringTmpl->get:3) + '.gif';
				'" border="0" width="240" height="280"></td>';
				
			'</tr>';
			
	'</table>';
	'</td>';
	'</tr>';
	'</table>';
?>

