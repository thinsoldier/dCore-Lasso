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
inline:	-Username=dCoreModTag_coreConfig->username, 
			-Password=dCoreModTag_coreConfig->password;

if: (var:'tmplnum') != '';
	local:'tempSettings' = (var:'tmplnum')->(split:'.lassoapp')->(get:1);

else: (#dCoreContent->get:3->get:1->get:6) != '';
	local:'tempSettings' = (#dCoreContent->get:3->get:1->get:6);
/if;
	


	
'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Green:'Content Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" size="70" name="title" value="' + (#dCoreContent->get:3->get:1->get:2) + '"></td>';
		'</tr>';
		'</table>';
		
	'</td>';
	'<td valign="top" width="241" rowspan=2>';
		dCoreModTag_hd241Grey:'Content Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			'<select name="approved">';
			'<option value="0">Select';
				'<option value="0"';
				if: (#dCoreContent->get:3->get:1->get:3) != '1';
					'selected ';
				/if;
				'>No';
				'<option value="1"';
				if: (#dCoreContent->get:3->get:1->get:3) == '1';
					'selected ';
				/if;
				'>Yes';
			'</select>';
			'</td>';
			'</tr>';
				'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Search:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			'<select name="search">';
			'<option value="0">Select';
				'<option value="0"';
				if: (#dCoreContent->get:3->get:1->get:29) != '1';
					'selected ';
				/if;
				'>Included';
				'<option value="1"';
				if: (#dCoreContent->get:3->get:1->get:29) == '1';
					'selected ';
				/if;
				'>Not Included';
			'</select>';
			'</td>';
			'</tr>';
			if: (#dCoreContent->get:3->get:1->get:5) != '';
				var:'catnum' = (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#dCoreContent->get:3->get:1->get:5));
			/if;
			
			'<tr valign="top">';
				'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Category:</b></td>';
				'<td bgcolor="white" align="center" width="90">';
				'<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avcat') + '&catnum='+ $catnum +'" class="body">';
				dcoremodtag_core_categories->getTitle:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),($catnum))->get:1;
				'</a></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Text Mode:</b></td>';
				'<td bgcolor="white" align="center">';
				'<select name="mode">';
				
				local:'appModeLimitsType' = dCoreAPI_runTag->infoMode:(#tempSettings);
					'<option value="' + (#appModeLimitsType->get:1) + '">Select';
				
				iterate: #appModeLimitsType, local:'modeOption';	
					'<option value="' + #modeOption + '"';
					if: (#dCoreContent->get:3->get:1->get:10) == #modeOption;
						' selected ';
					/if;
					'>' + #modeOption;
				/iterate;
				'</select>';
				'</td>';
			'</tr>';
			if: (#dCoreContent->get:3->get:1->get:5) == '';
				local:'catNumLook' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),($catnum));
			else;
				local:'catNumLook' = (#dCoreContent->get:3->get:1->get:5);
			/if;
			
			
			local:'dCoreCategoryHP' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(#catNumLook)))),(array:'category_homepage')));
			if: #dCoreCategoryHP->get:3->get:1->get:1 == '1';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Homepage Listings:</b></td>';
				'<td bgcolor="white" align="center">';
				'<select name="homepage">';
				'<option value="0">Select';
				'<option value="0"';
				if: (#dCoreContent->get:3->get:1->get:20) == '0';
					' selected ';
				/if;
				'>Deny';
				'<option value="1"';
				if: (#dCoreContent->get:3->get:1->get:20) == '1';
					' selected ';
				/if;
				'>Allow';
				'</select>';
				'</td>';
				
			'</tr>';
			
			/if;
		'</table>';
		
		dCoreModTag_hd241Grey:'Content Permissions',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		
		'<tr valign="top">';
			'<td bgcolor="#ffffff" width="150"><b>User Group</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Read</b></td>';
		'</tr>';
		'<tr>';
			'<td bgcolor="#ffffff" width="150"><b>Public</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center">';
			
			if: (dCoreModTag_perms_categories->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->(find:'_0')->size > 0;
				'<input type="checkbox" name="access" value="_0"';
				if: (#dCoreContent->get:3->get:1->get:8)->(split:',')->(find:'_0')->size > 0;' checked';/if;
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
				
				if: (dCoreModTag_perms_categories->read:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$catnum))->find: (#getAllItem->get:1)->size > 0;
					'<input type="checkbox" name="access" value="' + (#getAllItem->get:1) + '"';
					if: (#dCoreContent->get:3->get:1->get:8)->(split:',')->find: (#getAllItem->get:1)->size > 0;' checked';/if;
					'>';
				else;
					'<img src="dCoreIMG_core/icon_cross.gif">';
				/if;
				'</td>';
			
			'</tr>';
		
		else;
		
			'<input type="hidden" name="access" value="' + (#getAllItem->get:1) + '">';
		/if;
	/iterate;	
		
		'</table>';
	'</td>';
	
	'</tr>';
	
	// insert intro for HTML templates
	
	
	
	'<tr valign="top">';
	'<td valign="top" width="500">';
	if: ((dCoreAPI_runTag->infoMode:(#tempSettings))->(find:'HTML')->size > 0) || ((dCoreAPI_runTag->infoMode:(#tempSettings))->(find:'LDML')->size > 0);
		dCoreModTag_hd500Grey:'Plain Text Intro',-encodenone;
		'<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="5" name="intro">';(#dCoreContent->get:3->get:1->get:14);'</textarea></td>';
		'</tr>';
			
		'</table>';
		'<br>';
		
		if: ((dCoreAPI_runTag->infoMode:(#tempSettings))->(find:'HTML')->size > 0);
		dCoreModTag_hd500Grey:'Content HTML',-encodenone;
		
		'<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff">';
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
			[var:'encodeText' = (#dCoreContent->get:3->get:1->get:7)]
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
			
			
			
			
			
			
			'</td>';
		'</tr>';
			
		'</table>';
		
		else;
		dCoreModTag_hd500Grey:'Content LDML',-encodenone;
		
		'<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="20" name="text">';(#dCoreContent->get:3->get:1->get:7);'</textarea></td>';
		'</tr>';
			
		'</table>';
	/if;
		
	else;
		dCoreModTag_hd500Grey:'Content Text',-encodenone;
		
		'<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="20" name="text">';(#dCoreContent->get:3->get:1->get:7);'</textarea></td>';
		'</tr>';
			
		'</table>';
	/if;
		
	'</td>';
	
	'<td valign="top" width="241">';
	
	dCoreModTag_hd241Grey:'Template Appearance',-encodenone;
		'<table>';
			'<tr valign="top">';
				if: (var:'tmplnum') != '';
					'<td align="center">';
					'<img src="';
					(var:'tmplnum');
					'" border="0" width="240" height="250">';
					'</td>';
				else;
					'<td align="center"><img src="';
					local:'stringTmpl' = (#dCoreContent->get:3->get:1->get:6)->(split:'_');
					
					(#dCoreContent->get:3->get:1->get:6)+ '.lassoapp?-responselassoapp=' + 'dCoreTmpl_content_img_' + (#stringTmpl->get:3) + '.gif';
					'" border="0" width="240" height="250"></td>';
				/if;
				
			'</tr>';
	'</table>';
	
	'</td>';
	
	'</tr>';
	
	
	if: dCoreAPI_runTag->infoImg:(local:'tempSettings')->size > 0;
		local:'imgNum' = (array:'imgOne','imgTwo','imgThree','imgFour','imgFive');
		local:'imgPos' = (array:18,21,22,23,24);		
	
		iterate: dCoreAPI_runTag->infoImg:(local:'tempSettings'), local:'imageGrabDetails';
		local:'imgPosLoop' = (loop_count);
		'<tr valign="top">';
		'<td valign="top" width="746" colspan="2">';
			dCoreModTag_hd746Grey:'Content Image',-encodenone;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
			
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>Image</b></td>';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>Thumbnail</b></td>';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>Template Settings</b></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="center">';
				
				if: (local:'tempSettings') != '';
					'<b>Image</b> : 'dCoreAPI_runTag->infoImg:(local:'tempSettings')->get:(loop_count)->first;
					'<br><br>';
					'<b>Size WxH </b><br>' + dCoreAPI_runTag->infoImg:(local:'tempSettings')->get:(loop_count)->second;
				/if;
				
				'</td>';
				'<td bgcolor="#ffffff" valign="middle" align="center">';
				
				if: dCoreAPI_appImg->get:1->get:3 != '';
					'<select name="' + (#imgNum->get:(loop_count)) + '" onChange="show' + (#imgNum->get:(loop_count)) + '()">';
					'<option value="dCoreIMG_core/xx.gif">Select Image';
					iterate: dCoreAPI_appImg, local:'appImgItem';
					
						'<option value="'+ (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#appImgItem->get:3) + '"';
						if: (#dCoreContent->get:3->get:1->get:(#imgPos->get:#imgPosLoop)) == (#appImgItem->get:3);
							' selected';
						/if;
						'>';(#appImgItem->get:2);
					/iterate;
					'</select>';
				else;
					'<b><font color=red>No Images Available</font></b>';
				/if;
				
				'</td>';
				'<td bgcolor="#ffffff" valign="middle" align="center">';
				'<img src="';
				if:(#dCoreContent->get:3->get:1->get:(#imgPos->get:(loop_count))) !='';
					(dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#dCoreContent->get:3->get:1->get:(#imgPos->get:(loop_count)));
				else;
					'dCoreIMG_core/xx.gif';
				/if;
				'" name="con_' + (#imgNum->get:(loop_count)) + '" border="0">';
				'</td>';
				
			'</tr>';
			'</table>';
			
		'</td>';
		
		'</tr>';
		/iterate;
	/if;	
	
	
	
	if: (dCoreAPI_runTag->infoFile:(#tempSettings))->size > 0;
	local:'fileNum' = (array:'fileOne','fileTwo','fileThree','fileFour','fileFive');
	iterate: dCoreAPI_runTag->infoFile:(local:'tempSettings'), local:'fileGrabDetails';
		
		'<tr>';
		'<td valign="top" width="746" colspan="2">';
			dCoreModTag_hd746Grey:'Content File',-encodenone;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
			
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>File Limitations</b></td>';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>File</b></td>';
				'</tr>';
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="center">';
				
					'<b>Types</b> : ' + dCoreAPI_runTag->infoFile:(#tempSettings)->get:(loop_count)->second->(split:'=')->(get:1);
					'<br><br>';
					'<b>Max Size</b><br>' + dCoreAPI_runTag->infoFile:(#tempSettings)->get:(loop_count)->second->(split:'=')->(get:2) + ' bytes';
				
				
				'</td>';
				'<td bgcolor="#ffffff" valign="middle" align="center">';
				
				
				'<select name="fileOne">';
				'<option value="">Select File';
				iterate: dCoreAPI_appFile, local:'appFileItem';
					local:'appFileLimitsType' = dCoreAPI_runTag->infoFile:(#tempSettings)->(get:1)->second->(split:'=')->(get:1)->(split:' ');
					local:'appFileLimitsSize' = dCoreAPI_runTag->infoFile:(#tempSettings)->(get:1)->second->(split:'=')->(get:2);

					if: #appFileItem->get:1 != '';
						if: ((#appFileLimitsType->find:((#appFileItem->get:2->(split:'.'))->(get:2)))->size > 0) && ((#appFileItem->get:4) <= (#appFileLimitsType));
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
		/iterate;
	/if;	
	
	if: dCoreAPI_runTag->infoLink:(#tempSettings) > 0;
		'<tr valign="top">';
			'<td valign="top" width="746" colspan="2">';
				dCoreModTag_hd746Grey:'Content Link',-encodenone;
				'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				
				'<tr valign="top">';
					'<td bgcolor="#ffffff" valign="middle" align="left"><b>Link URL</b></td>';
					'<td bgcolor="#ffffff" valign="middle" align="left"><b>Link Text</b></td>';
					
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="#ffffff" valign="middle" align="left"><input type="text" name="url" size="60" value="' + (#dCoreContentLink->get:3->get:1->get:3) + '"></td>';
					'<td bgcolor="#ffffff" valign="middle" align="left"><input type="text" name="urlTitle" size="45" value="' + (#dCoreContentLink->get:3->get:1->get:4) + '"></td>';
					
				'</tr>';
				
				'</table>';
				
			'</td>';
		
		'</tr>';
	
	
	
	/if;		
	
	'<tr valign="top">';
			'<td valign="top" width="746" colspan="2">';
			
				var:'contentstartDay' = (string_extract: -startposition=7, -endposition=8,(#dCoreContent->get:3->get:1->get:15));
				$contentstartDay->(removeleading:'0');
				var:'contentstartMonth' = (string_extract: -startposition=5, -endposition=6,(#dCoreContent->get:3->get:1->get:15));
				$contentstartMonth->(removeleading:'0');
				var:'contentstartYear' = (string_extract: -startposition=1, -endposition=4,(#dCoreContent->get:3->get:1->get:15));
				var:'contentstartHour' = (string_extract: -startposition=9, -endposition=10,(#dCoreContent->get:3->get:1->get:15));
				var:'contentstartMin' = (string_extract: -startposition=11, -endposition=12,(#dCoreContent->get:3->get:1->get:15));
				
				
				
				var:'contentendDay' = (string_extract: -startposition=7, -endposition=8,(#dCoreContent->get:3->get:1->get:16));
				$contentendDay->(removeleading:'0');
				var:'contentendMonth' = (string_extract: -startposition=5, -endposition=6,(#dCoreContent->get:3->get:1->get:16));
				$contentendMonth->(removeleading:'0');
				var:'contentendYear' = (string_extract: -startposition=1, -endposition=4,(#dCoreContent->get:3->get:1->get:16));
				var:'contentendHour' = (string_extract: -startposition=9, -endposition=10,(#dCoreContent->get:3->get:1->get:16));
				var:'contentendMin' = (string_extract: -startposition=11, -endposition=12,(#dCoreContent->get:3->get:1->get:16));
				
				
				
				dCoreModTag_hd746Grey:'Content LifeTime',-encodenone;
				var:'monthsArray' = (array:'January','February','March','April','June','July','August','September','October','November','December');
				'<table border="0" width="100%" cellpadding="4" cellspacing="0">';
					'<tr>';
						'<td>&nbsp;<B>Content Availability</b></td>';
						
					'</tr>';
					'<tr>';
					'<td valign="top" width="65%">';
						'<table border="0" width="100%">';
						'<tr>';
						'<td>&nbsp;<B>Date</b></td>';
						'<td>&nbsp;<B>Time</b></td>';
						'</tr>';
						var:'contentStatusArray' = (array:'contentStart','contentEnd');
						loop: $contentStatusArray->size;
							var:'contentStatusArrayshow' = $contentStatusArray->(get:(loop_count));
							
							
							
							'<tr>';
							
								'<td>';
									'<select name="' + ($contentStatusArray->(get:(loop_count))) + '_day">';
									'<option value="';
									if: (loop_count) == 1;
										'00';
									else;
										'99';
									/if;
									'">NA';
									loop: 31;
										'<option value="';
										if:(loop_count) <= 9;
											'0';
										/if;
										loop_count;
										'" ';
										if: (string:(var:$contentStatusArrayshow + 'Day')) == (loop_count);
											' selected';
										/if;
										'>';
										if:(loop_count) <= 9;
											'0';
										/if;
										loop_count;
									/loop;
									'</select>'
									'<select name="' + ($contentStatusArrayshow) + '_month">';
									'<option value="';
									if: (loop_count) == 1;
										'00';
									else;
										'99';
									/if;
									'">NA';
									loop: ($monthsArray->(size));
									
										'<option value="';
										if:(loop_count) <= 9;
											'0';
										/if;
										loop_count;
										'" ';
										if: (var:$contentStatusArrayshow + 'Month') == (loop_count);
											' selected';
											var:$contentStatusArrayshow + 'Month' = '1';
										/if;
										'>';
										$monthsArray->(get:(loop_count));
										
									/loop;
									'</select>';
									'<select name="';
									$contentStatusArrayshow + '_year">';
									'<option value="';
									if: (loop_count) == 1;
										'0000';
									else;
										'9999';
									/if;
									'">NA';
									loop:  -loopfrom=2004, -loopto=2015;
										'<option value="';
										loop_count;
										'" ';
										if: (var:$contentStatusArrayshow + 'Year') == (loop_count);
											' selected';
										/if;
										'>';
										loop_count;
									/loop;
									'</select>';
								'</td>';
								
								'<td>';
									'<select name="';
									$contentStatusArrayshow + '_hour">';
									'<option value="';
									if: (loop_count) == 1;
										'00';
									else;
										'99';
									/if;
									'">NA';
									loop: -loopfrom=0, -loopto=23;
									
										'<option value="';
										if:(loop_count) <= 9;
											var:$contentStatusArrayshow + 'hourloop' = '0';
										else;
											var:$contentStatusArrayshow + 'hourloop' = '';
										/if;
										var:$contentStatusArrayshow + 'hourloop';
										loop_count;
										'" ';
										if: (var:'contentStatusArrayshownonselect') != '1';
											if: ((var:$contentStatusArrayshow + 'Hour') == (string:(var:$contentStatusArrayshow + 'hourloop') + (loop_count)));
												' selected';
											else: ((string:(var:$contentStatusArrayshow + 'yearloop') + (loop_count)) == (var:'Ucal_year'));
												' selected';
											/if;
										/if;
										'>';
										if:(loop_count) <= 9;
											'0';
										/if;
										loop_count;
										
									/loop;
									'</select><B>:</b>';
									'<select name="';
									$contentStatusArrayshow;
									'_min">';
									'<option value="';
									if: (loop_count) == 1;
										'00';
									else;
										'99';
									/if;
									'">NA';
									
									loop: -loopfrom=0, -loopto=59, -loopincrement=15;
									
										'<option value="';
										if:(loop_count) <= 9;
											var:$contentStatusArrayshow + 'minloop' = '0';
										else;
											var:$contentStatusArrayshow + 'minloop' = '';
										/if;
										var:$contentStatusArrayshow + 'minloop';
										loop_count;
										'" ';
										if: (var:'contentStatusArrayshownonselect') != '1';
											if: (var:$contentStatusArrayshow + 'Min') == (string:(var:$contentStatusArrayshow + 'minloop') + (loop_count));
											' selected';
											/if;
										/if;
										'>';
										if:(loop_count) <= 9;
											'0';
										/if;
										loop_count;
										
									/loop;
									'</select>';
								
								'</td>';
								
							'</tr>';
						/loop;
						'</table>';
					'</td>';
					
					'</tr>';
					'</table>';
			
	
				
			'</td>';
		
		'</tr>';
'</table>';

	/inline;
?>

