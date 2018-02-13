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



local: 'dCoreSections' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectnum'))))),(array:'id','section_title','section_approved','section_levels','section_homepage')));

if: (var:'tmplnum') != '';
	local:'tempSettings' = (var:'tmplnum')->(split:'.lassoapp')->(get:1);

else: (#dCoreCategories->get:3->get:1->get:5) != '';
	local:'tempSettings' = (#dCoreCategories->get:3->get:1->get:5);
/if;

'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Green:'Category Inforamation',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" size="70" name="name" value="' + (#dCoreCategories->get:3->get:1->get:2) + '"></td>';
		'</tr>';
		'</table>';
		
	'</td>';
	'<td valign="top" width="241"  rowspan="2">';
		dCoreModTag_hd241Grey:'Category Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			'<select name="approved">';
			'<option value="0">Select';
				'<option value="0"';
				if: (#dCoreCategories->get:3->get:1->get:3) != '1';
					'selected ';
				/if;
				'>No';
				'<option value="1"';
				if: (#dCoreCategories->get:3->get:1->get:3) == '1';
					'selected ';
				/if;
				'>Yes';
			'</select>';
			'</td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Child Access:</b></td>';
				'<td bgcolor="white" align="center">';
				'<select name="child">';
					'<option value="0"';
					if: (#dCoreCategories->get:3->get:1->get:18) != '1';
						'selected ';
					/if;
					'>Yes';
					'<option value="1"';
					if: (#dCoreCategories->get:3->get:1->get:18) == '1';
						'selected ';
					/if;
					'>No';
				'</select>';
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
			'<td valign="top" bgcolor="#ffffff">';'&nbsp;&nbsp;<b>Section</b>';'</td>';
			'<td valign="top" bgcolor="#ffffff" align="center"><a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avs')+'&sectnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#dCoreSections->get:3->get:1->get:1))+'" class="body">';(#dCoreSections->get:3->get:1->get:2);'</td>';
		'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Text Mode:</b></td>';
				'<td bgcolor="white" align="center">';
				'<select name="mode">';
				local:'appModeLimitsType' = dCoreAPI_runTag->infoMode:(#tempSettings);
					'<option value="' + (#appModeLimitsType->get:1) + '">Select';
				
				iterate: #appModeLimitsType, local:'modeOption';	
					'<option value="' + #modeOption + '"';
					if: (#dCoreCategories->get:3->get:1->get:9) == #modeOption;
						' selected ';
					/if;
					'>' + #modeOption;
				/iterate;
				'</select>';
				'</td>';
				
			'</tr>';
			
			if: #dCoreSections->get:3->get:1->get:5 == '1';
			
			
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Homepage Listings:</b></td>';
					'<td bgcolor="white" align="center">';
					'<select name="homepage">';
					'<option value="0">Select';
					'<option value="0"';
					if: (#dCoreCategories->get:3->get:1->get:17) == '0';
						' selected ';
					/if;
					'>Deny';
					'<option value="1"';
					if: (#dCoreCategories->get:3->get:1->get:17) == '1';
						' selected ';
					/if;
					'>Allow';
					'</select>';
					'</td>';
					
				'</tr>';
			/if;
		
		'</table>';
		
		
		
	'</td>';
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="500">';
		dCoreModTag_hd500Grey:'Category Text',-encodenone;
		'<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff">';
			if: ((dCoreAPI_runTag->infoMode:(#tempSettings))->(find:'HTML')->size > 0);
	
				?>
			<script language="JavaScript" type="text/javascript">
			<!--
			function submitForm() {
				updateRTE('text');
				
				return true;
			}
			
			//Usage: initRTE(imagesPath, includesPath, cssFile)
			initRTE("dcorerte/dcoreIMG_RTE/", "dcorerte/", "");
			//-->
			</script>
			<noscript><p><b>Javascript must be enabled to use this form.</b></p></noscript>
			
			<script language="JavaScript" type="text/javascript">
			[html_comment]
			// LDML encoding for Rich Text editor
			[var:'encodeText' = (#dCoreCategories->get:3->get:1->get:6)]
			[var:'encodeTextBreaks' = (string_replace: -find='\n',-replace='',($encodeText))]
			[var:'encodeTextBreaks' = (string_replace: -find='\r',-replace='',($encodeTextBreaks))]
			//Usage: writeRichText(fieldname, html, width, height, buttons, readOnly)
			writeRichText('text', '[(string_replace: -find='\'',-replace='&#39;',$encodeTextBreaks)]', 400, 200, true, false);
			[/html_comment]
			</script>
			
			<?lassoscript
			
			'<script language="JavaScript" type="text/javascript">\n';
			'<!--\n';
			'function submitForm() {\n';
				'//make sure hidden and iframe values are in sync before submitting form\n';
				'//to sync only 1 rte, use updateRTE(rte)\n';
				'//to sync all rtes, use updateRTEs\n';
				'updateRTE(\'text\');\n';
				'//updateRTEs();\n';
				//'alert("text = " + document.con_form.text.value);\n';
				
				'//change the following line to true to submit form\n';
				'return true;\n';
			'}\n';
			
			'//Usage: initRTE(imagesPath, includesPath, cssFile)\n';
			'initRTE("dCoreIMG_rte/", "", "");\n';
			'//-->\n';
			'</script>\n';
			
			
			else;
			
			'<textarea cols="100" rows="20" name="text">';(#dCoreCategories->get:3->get:1->get:6);'</textarea>';
			
			/if;
			
			'</td>';
		'</tr>';
			
		'</table>';
	'</td>';
	
	'<td valign="top" width="241">';
	dCoreModTag_hd241Grey:'Template Appearance',-encodenone;
		'<table>';
			'<tr valign="top">';
				if: (var:'tmplnum') != '';
					'<td align="center">';
					'<img src="';
					(var:'tmplnum');
					'" border="0" width="240">';
					'</td>';
				else;
					'<td align="center"><img src="';
					local:'stringTmpl' = (#dCoreCategories->get:3->get:1->get:5)->(split:'_');
				
					(#dCoreCategories->get:3->get:1->get:5)+ '.lassoapp?-responselassoapp=' + 'dCoreTmpl_category_img_' + (#stringTmpl->get:3) + '.gif';
					'" border="0"></td>';
				/if;
				
			'</tr>';
	'</table>';
	'</td>';
	'</tr>';
	
	
	if: dCoreAPI_runTag->infoImg:(#tempSettings)->size > 0;
		'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Grey:'Category Image',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		
		'<tr valign="top">';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Template Settings</b></td>';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Image</b></td>';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Thumbnail</b></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#ffffff" valign="middle" align="center">';
			
			 
			if: ((#tempSettings) != '');
				'<b>Image</b> : 'dCoreAPI_runTag->infoImg:(#tempSettings)->get:1->first;
				'<br><br>';
				'<b>Size WxH </b><br>' + dCoreAPI_runTag->infoImg:(#tempSettings)->get:1->second;
			/if;
			'</td>';
			'<td bgcolor="#ffffff" valign="middle" align="center">';
			'<select name="imgOne" onChange="showimgOne()">';
			'<option value="dCoreIMG_core/xx.gif">Select Image';
			iterate: dCoreAPI_appImg, local:'appImgItem';
				'<option value="'+ (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#appImgItem->get:3) + '"';
				if: (#dCoreCategories->get:3->get:1->get:12) == (#appImgItem->get:3);
				
					' selected';
				
				/if;
								
				'>';(#appImgItem->get:2);
			/iterate;
			'</select>';
			
			'</td>';
			'<td bgcolor="#ffffff" valign="middle" align="center">';
			'<img src="';
			if:(#dCoreCategories->get:3->get:1->get:12) !='';
				(dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#dCoreCategories->get:3->get:1->get:12);
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
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Grey:'Category Permissions',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="#ffffff" width="150"><b>User Group</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Read</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Write</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Edit</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Delete</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Upload</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Moderator</b></td>';
			
		'</tr>';
		'<tr>';
				'<td bgcolor="#ffffff" width="150"><b>Public</b></td>';
				'<td bgcolor="#ffffff" width="60" align="center">';
				if: (dCoreModTag_perms_sections->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->(find: '_0')->size > 0;
					'<input type="checkbox" name="read" value="_0"';
					if: (dCoreModTag_perms_categories->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->(find: '_0')->size > 0;' checked';/if;
					'>';
				else;
					'<img src="dCoreIMG_core/icon_cross.gif">';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" width="60" align="center">';
				if: (dCoreModTag_perms_sections->write:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->(find: '_0')->size > 0;
					'<input type="checkbox" name="write" value="_0"';
					if: (dCoreModTag_perms_categories->write:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->(find: '_0')->size > 0;' checked';/if;
					'>';
				else;
					'<img src="dCoreIMG_core/icon_cross.gif">';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" width="60" align="center">';
				if: (dCoreModTag_perms_sections->edit:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->(find: '_0')->size > 0;
					'<input type="checkbox" name="edit" value="_0"';
					if: (dCoreModTag_perms_categories->edit:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->(find: '_0')->size > 0;' checked';/if;
					'>';
				else;
					'<img src="dCoreIMG_core/icon_cross.gif">';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" width="60" align="center">';
				if: (dCoreModTag_perms_sections->delete:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->(find: '_0')->size > 0;
					'<input type="checkbox" name="delete" value="_0"';
					if: (dCoreModTag_perms_categories->delete:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->(find: '_0')->size > 0;' checked';/if;
					'>';
				else;
					'<img src="dCoreIMG_core/icon_cross.gif">';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" width="60" align="center">';
				if: (dCoreModTag_perms_sections->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->(find: '_0')->size > 0;
					'<input type="checkbox" name="upload" value="_0"';
					if: (dCoreModTag_perms_categories->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->(find: '_0')->size > 0;' checked';/if;
					'>';
				else;
					'<img src="dCoreIMG_core/icon_cross.gif">';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" width="60" align="center">';
				if: (dCoreModTag_perms_sections->moderator:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->(find: '_0')->size > 0;
					'<input type="checkbox" name="moderator" value="_0"';
					if: (dCoreModTag_perms_categories->moderator:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->(find: '_0')->size > 0;' checked';/if;
					'>';
				else;
					'<img src="dCoreIMG_core/icon_cross.gif">';
				/if;
				'</td>';
				
			'</tr>';
		iterate: dCoreModTag_core_userGroups->getAll, local:'getAllItem';
			if: #getAllItem->get:2 != 'Administrator';
				'<tr>';
					'<td bgcolor="#ffffff" width="150"><b>' + #getAllItem->get:2 + '</b></td>';
					'<td bgcolor="#ffffff" width="60" align="center">';
					if: (dCoreModTag_perms_sections->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size > 0;
						'<input type="checkbox" name="read" value="' + (#getAllItem->get:1) + '"';
						if: (dCoreModTag_perms_categories->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->find: (#getAllItem->get:1)->size > 0;' checked';/if;
						'>';
					else;
						'<img src="dCoreIMG_core/icon_cross.gif">';
					/if;
					'</td>';
					'<td bgcolor="#ffffff" width="60" align="center">';
					if: (dCoreModTag_perms_sections->write:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size > 0;
						'<input type="checkbox" name="write" value="' + (#getAllItem->get:1) + '"';
						if: (dCoreModTag_perms_categories->write:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->find: (#getAllItem->get:1)->size > 0;' checked';/if;
						'>';
					else;
						'<img src="dCoreIMG_core/icon_cross.gif">';
					/if;
					'</td>';
					'<td bgcolor="#ffffff" width="60" align="center">';
					if: (dCoreModTag_perms_sections->edit:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size > 0;
						'<input type="checkbox" name="edit" value="' + (#getAllItem->get:1) + '"';
						if: (dCoreModTag_perms_categories->edit:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->find: (#getAllItem->get:1)->size > 0;' checked';/if;
						'>';
					else;
						'<img src="dCoreIMG_core/icon_cross.gif">';
					/if;
					'</td>';
					'<td bgcolor="#ffffff" width="60" align="center">';
					if: (dCoreModTag_perms_sections->delete:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size > 0;
						'<input type="checkbox" name="delete" value="' + (#getAllItem->get:1) + '"';
						if: (dCoreModTag_perms_categories->delete:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->find: (#getAllItem->get:1)->size > 0;' checked';/if;
						'>';
					else;
						'<img src="dCoreIMG_core/icon_cross.gif">';
					/if;
					'</td>';
					'<td bgcolor="#ffffff" width="60" align="center">';
					if: (dCoreModTag_perms_sections->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size > 0;
						'<input type="checkbox" name="upload" value="' + (#getAllItem->get:1) + '"';
						if: (dCoreModTag_perms_categories->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->find: (#getAllItem->get:1)->size > 0;' checked';/if;
						'>';
					else;
						'<img src="dCoreIMG_core/icon_cross.gif">';
					/if;
					'</td>';
					'<td bgcolor="#ffffff" width="60" align="center">';
					if: (dCoreModTag_perms_sections->moderator:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$sectnum))->find: (#getAllItem->get:1)->size > 0;
						'<input type="checkbox" name="moderator" value="' + (#getAllItem->get:1) + '"';
						if: (dCoreModTag_perms_categories->moderator:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->find: (#getAllItem->get:1)->size > 0;' checked';/if;
						'>';
					else;
						'<img src="dCoreIMG_core/icon_cross.gif">';
					/if;
					'</td>';
					
				'</tr>';
			
			else;
			
				'<input type="hidden" name="read" value="' + (#getAllItem->get:1) + '">';
				'<input type="hidden" name="write" value="' + (#getAllItem->get:1) + '">';
				'<input type="hidden" name="edit" value="' + (#getAllItem->get:1) + '">';
				'<input type="hidden" name="delete" value="' + (#getAllItem->get:1) + '">';
				'<input type="hidden" name="upload" value="' + (#getAllItem->get:1) + '">';
				'<input type="hidden" name="moderator" value="' + (#getAllItem->get:1) + '">';
				
				
			/if;
		/iterate;
		
		'</table>';
	'</td>';
	
	'</tr>';		
'</table>';

	
?>

