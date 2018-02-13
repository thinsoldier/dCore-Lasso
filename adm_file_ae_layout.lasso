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



'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="3">';
		dCoreModTag_hd746Orange:'File To Upload',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb"></td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	
	'<td valign="top" width="241"  colspan="2" rowspan="2">';
		dCoreModTag_hd241Grey:'File Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			'<select name="approved">';
			'<option value="0">Select';
				'<option value="0"';
				if: (#dCoreFiles->get:3->get:1->get:3) != '1';
					'selected ';
				/if;
				'>No';
				'<option value="1"';
				if: (#dCoreFiles->get:3->get:1->get:3) == '1';
					'selected ';
				/if;
				'>Yes';
			'</select>';
			'</td>';
			'</tr>';
		if: $pg == 'Aefile';
			'<tr valign="top">';
				'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Category:</b></td>';
				'<td bgcolor="white" align="center" width="90">';
				'<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avfcat') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:6)+'" class="body">';
				dcoremodtag_core_fileCat->getTitle:(#dCoreFiles->get:3->get:1->get:6)->get:1;
				'</a></td>';
			'</tr>';
		/if;
		'</table>';
		
		
		
	'</td>';
	
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="241" rowspan=2>';
		dCoreModTag_hd241Grey:'File Description',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="45" rows="10" name="text">';(#dCoreFiles->get:3->get:1->get:4);'</textarea></td>';
		'</tr>';
			
		'</table>';
	'</td>';
	if:((var:'ftype') == 'image') || ((#dCoreFiles->get:3->get:1->get:9) >> 'image');
	
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Thumbnail Size',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" colspan="4">&nbsp;&nbsp;Size Type&nbsp;';
			'<select name="flFileThumType">';
			if: $pg == 'Aefile';
				'<option value="ignore">Ignore';
			/if;
			'<option value="scale">Scale<option value="fixed">Fixed Width</select></td>';
			
		'</tr>';
		
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Scale Pixel Width:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<input type="text" name="flImgThumScale" size="5" value="20"><b>%</b></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Fixed Pixel Width:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<input type="text" name="flImgThumWidth" size="10"></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Fixed Pixel Height:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<input type="text" name="flImgThumHeight" size="10"></td>';
			
		'</tr>';
	
		'</table>';
		
		
	
	'</td>';
	'<td>';
		if: (var:'fType') != 'image';
			dCoreModTag_hd241Grey:'File Information',-encodenone;
			inline: 
			-Username=(dCoreModTag_coreConfig->username), 
			-Password=(dCoreModTag_coreConfig->password);
			
			var:'getImage' = image:((dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreFiles->get:3->get:1->get:6) + '/' + (#dCoreFiles->get:3->get:1->get:2));
			
			
			/inline;
			'<table border="0">';
			'<tr>';
			'<td><b>File Name:</b></td>';
			'<td><a href="' + (dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreFiles->get:3->get:1->get:6) + '/' + (#dCoreFiles->get:3->get:1->get:2)'" target="blank" class="body">' + (#dCoreFiles->get:3->get:1->get:2) + '</a></td>';
			'</tr>';
			'<tr>';
			'<td><b>Size:</b></td>';
			'<td> ' + (#dCoreFiles->get:3->get:1->get:12) + ' bytes</td>';
			'</tr>';
			'<tr>';
			'<td><b>Width:</b></td>';
			'<td> ' + (#getImage->width) + ' Pixels</td>';
			'</tr>';
			'<tr>';
			'<td><b>Height:</b></td>';
			'<td> ' + (#getImage->height) + ' Pixels</td>';
			'</tr>';
			'</table>';
		/if;
	'</td>';
	
	
	else;
	
		'<td>';
			dCoreModTag_hd241Grey:'File Information',-encodenone;
			'<table border="0"><tr><td><b>File Name:</b></td><td><a href="' + (dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreFiles->get:3->get:1->get:6) + '/' + (#dCoreFiles->get:3->get:1->get:2)'" target="blank" class="body">' + (#dCoreFiles->get:3->get:1->get:2) + '</a></td></tr><tr><td><b>Size:</b></td><td> ' + (#dCoreFiles->get:3->get:1->get:12) + ' bytes</td></tr></table>';
		'</td>';
		
	/if;
	
	
	
	'</tr>';
	'<tr>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'File Name',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" colspan="4">&nbsp;&nbsp;Adjust File Name&nbsp;';
			'<select name="flFilenameConf"><option value="0">No<option value="1">Yes</select></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>FileName:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<input type="text" name="flFilename"></td>';
			
		'</tr>';
		
		'</table>';
		
		
	
	'</td>';
	if:((var:'ftype') == 'image') || ((#dCoreFiles->get:3->get:1->get:9) >> 'image');
	
	if: $pg == 'Aefile';
		'<td valign="top" width="241" rowspan="2" align="center">';
			dCoreModTag_hd241Grey:'Preview',-encodenone;
			
			
			'<p><a href="' + (dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreFiles->get:3->get:1->get:6) + '/' + (#dCoreFiles->get:3->get:1->get:2)'" target="blank"><img src="'+ (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#dCoreFiles->get:3->get:1->get:5) + '" border="0"></a></p>';
				
		'</td>';
	else;
		'<td valign="top" width="241" rowspan="2">';
			'<table border="0" width="241" cellpadding="2" cellspacing="0" bgcolor="#000000">';
			'<tr valign="top">';
				'<td bgcolor="white" align="left"><img src="dCoreIMG_core/xx.gif" border="0" height="10" width="241"></td>';
				
			'</tr>';
			
			'</table>';
			
			
		
		'</td>';
	/if;
	/if;
	'</tr>';
	if:((var:'ftype') == 'image') || ((#dCoreFiles->get:3->get:1->get:9) >> 'image');
	'<tr>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Image Overlay',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" colspan="4">&nbsp;&nbsp;Adjust Image Overlay&nbsp;';
			'<select name="flImgOverlayConf"><option value="0">No<option value="1">Yes</select></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Overlay Text:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<input type="text" name="flImgOverlayTxt" size="20"></td>';
			
		'</tr>';
		
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Font:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<select name="flImgOverlayFont"><option value="arial">Arial</select></td>';
			
		'</tr>';
		
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Size:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<select name="flImgOverlaySize"><option value="12">12<option value="11">11<option value="10">10<option value="9">9<option value="8">8</select></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Color:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<select name="flImgOverlayColor"><option value="#000000">Black<option value="#ffffff">White<option value="#a1a1a1">Grey</select></td>';
			
		'</tr>';
		'</table>';
		
		
		
	'</td>';
	'<td valign="top" width="241" colspan=2>';
		dCoreModTag_hd241Grey:'Image Dimensions',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" colspan="4">&nbsp;&nbsp;Adjust Image Dimensions&nbsp;';
			'<select name="flImgDimConf"><option value="0">No<option value="1">Yes</select></td>';
		'</tr>';
		
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Fixed Pixel Width:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<input type="text" name="flImgDimWidth" size="10"></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Fixed Pixel Height:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<input type="text" name="flImgDimHeight" size="10"></td>';
			
		'</tr>';
	
		'</table>';
	'</td>';
	'</tr>';
	'<tr>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Image Contrast',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" colspan="4">&nbsp;&nbsp;Adjust Image Contrast&nbsp;';
			'<select name="flImgContrastConfirm"><option value="0">No<option value="1">Yes</select></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Contrast:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<select name="flImgContrast"><option value="">Ignore<option value="true">Increase<option value="false">Decrease</select></td>';
			
		'</tr>';
		
		'</table>';
		
		
	'</td>';
	/*
	'<td valign="top" width="241" >';
		dCoreModTag_hd241Grey:'Image File Type',-encodenone;
		'<table border="0" width="241" cellpadding="0" cellspacing="1" bgcolor="#000000">';
		'<table border="0" width="241" cellpadding="0" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" colspan="4">&nbsp;&nbsp;Convert File Type&nbsp;';
			'<select name="flImgContrastFiletype"><option value="0">No<option value="1">Yes</select></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Convert To:</b></td>';
			'<td colspan="3" bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<select name="flImgContrastFiletype"><option value="gif">Gif<option value="jpg">JPG</select></td>';
			
		'</tr>';
		
		'</table>';
		
		
		
	'</td>';
	*/
	'</tr>';
	
	
	
	/if;
	
	
	
'</table>';

	
?>

