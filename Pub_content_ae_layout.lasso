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




'<p class="' + (dCoreModTag_tmplClass->content) + '">Please submit your page for approval.</p>';
	
'<table border="0" width="100%">';
	
	'<tr valign="top">';
	'<td valign="top" width="100%" colspan="2">';
		'<table border="0" width="100%" cellpadding="2" cellspacing="1" bgcolor="#000000"> ';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#cccccc"><b>Page Title:</b></td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap><input type="text" size="70" name="title" value="' + (#dCoreContent->get:3->get:1->get:2) + '"></td>';
		'</tr>';
		'</table>';
		
	'</td>';
	
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="100%">';
		'<table border="0" width="100%" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#cccccc"><b>Page Text:</b></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="10" name="text">';(#dCoreContent->get:3->get:1->get:7);'</textarea></td>';
		'</tr>';
			
		'</table>';
	'</td>';
	
	
	'</tr>';
	
	if: (var:'tmplnum') != '';
		local:'tempSettings' = (var:'tmplnum')->(split:'.lassoapp')->(get:1);
	
	else: (#dCoreContent->get:3->get:1->get:6) != '';
		local:'tempSettings' = (#dCoreContent->get:3->get:1->get:6);
	/if;
	if: dCoreAPI_runTag->infoImg:(local:'tempSettings')->size > 0;
		local:'imgNum' = (array:'imgOne','imgTwo','imgThree','imgFour','imgFive');
		local:'imgPos' = (array:'18','21','22','23','24');		
	
		iterate: dCoreAPI_runTag->infoImg:(local:'tempSettings'), local:'imageGrabDetails';
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
						if: (#dCoreContent->get:3->get:1->get:18) == (#appImgItem->get:3);
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
		'<tr>';
		'<td valign="top" width="100%" colspan="2">';
			'<table border="0" width="100%" cellpadding="2" cellspacing="1" bgcolor="#000000">';
			
			'<tr valign="top">';
				'<td bgcolor="#cccccc" valign="middle" align="center"><b>File Limitations</b></td>';
				'<td bgcolor="#cccccc" valign="middle" align="center"><b>File</b></td>';
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
					local:'appFileLimitsType' = dCoreAPI_runTag->infoFile:(#tempSettings)->get:1->second->(split:'=')->(get:1)->(split:' ');
					local:'appFileLimitsSize' = dCoreAPI_runTag->infoFile:(#tempSettings)->get:1->second->(split:'=')->(get:2);

					if: ((#appFileLimitsType->find:((#appFileItem->get:2->split:'.')->(get:2)))->size > 0) && ((#appFileItem->get:4) <= (#appFileLimitsType));
						'<option value="'+ (#appFileItem->get:1) + '"';
						if: (#dCoreContent->get:3->get:1->get:19) == (#appFileItem->get:1);
							' selected';
						/if;
						'>';(#appFileItem->get:2);
					/if;
				/iterate;
				'</select>';
				'</td>';
				
				
			'</tr>';
			'</table>';
			
		'</td>';
		
		'</tr>';
	/if;	
	if: dCoreAPI_runTag->infoLink:(#tempSettings) > 0;
	'<tr valign="top">';
		'<td valign="top" width="100%" colspan="2">';
			'<table border="0" width="100%" cellpadding="2" cellspacing="1" bgcolor="#000000">';
			
			'<tr valign="top">';
				'<td bgcolor="#cccccc" valign="middle" align="left"><b>Link URL</b></td>';
				'<td bgcolor="#cccccc" valign="middle" align="left"><b>Link Text</b></td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="left"><input type="text" name="url" size="60" value="' + (#dCoreContentLink->get:3->get:1->get:3) + '"></td>';
				'<td bgcolor="#ffffff" valign="middle" align="left"><input type="text" name="urlTitle" size="45" value="' + (#dCoreContentLink->get:3->get:1->get:4) + '"></td>';
				
			'</tr>';
			
			'</table>';
			
		'</td>';
		
		'</tr>';
	
	
	
	/if;		
'</table>';

	
?>

