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




							
local:'dCoreSections' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'sectnum'))))),(dCoreModTag_core_sections->setFields)->second));
local:'dCoreCategories' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum'))))),(dcoremodtag_core_categories->setFields)->second));

if: (var:'tmplnum') == '';

	
	
	'\n<table border="0" width="746">';
	
	'\n<tr>';
	'\n<form enctype="multipart/form-data" action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Accat') + '" method="post" name="con_form" onsubmit="return submitForm();">';
	'\n<input type="hidden" name="sectnum" value="' + (var:'sectnum') + '">';
	'\n<td valign="top" >';
		dCoreModTag_hd500Green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" class="title">Section Information</a>',-encodenone;
		'\n<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'\n<tr>';
			'\n<td bgcolor="white">';
		'\n<table border="0" width="100%" cellpadding="2" bgcolor="#ffffff">';
		'\n<tr>';
			'\n<td>';
			
				'\n<img src="';
					// fix for image problem
					local:'stringTmpl' = (#dCoreSections->get:3->get:1->get:4)->(split:'_');
					
					(#dCoreSections->get:3->get:1->get:4)+ '.lassoapp?-responselassoapp=' + 'dCoreTmpl_section_img_' + (#stringTmpl->get:3) + '.gif';
				'" border="0">';
				
			'\n</td>';
			'<td valign="top">';
			'&nbsp;<br><b>Section Name:</b>';
			'<br>';
			(#dCoreSections->get:3->get:1->get:2);
			'<br>';'<br>';
			'<b>Section Template:</b>';
			'<br>';
			dCoreAPI_runTag->name:(#dCoreSections->get:3->get:1->get:4);
			'<br>';'<br>';
			'<b>No. of Images:  </b>';
			dCoreAPI_runTag->infoImg:(#dCoreSections->get:3->get:1->get:4)->size;
			'<br>';
			'<br>';
			
			if: dCoreAPI_runTag->infoImg:(#dCoreSections->get:3->get:1->get:4)->size > 0;
				'<b>Image Sizes: (W x H)</b><br>';
				iterate: dCoreAPI_runTag->infoImg:(#dCoreSections->get:3->get:1->get:4), local:'imageInfo';
					'<br><b>Image ' + #imageInfo->first + ':  </b>  ' + #imageInfo->second;
				/iterate;
			/if;
			'</td>';
		'\n</tr>';
			
		'\n</table>';
		'</td>';
		'\n</tr>';
			
		'\n</table>';
		
	'\n</td>';
	'\n<td valign="top" >';
		dCoreModTag_hd746Green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" class="title">Category Template</a>',-encodenone;
		'\n<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'\n<tr>';
			'\n<td bgcolor="white">';
			'\n<select name="tmplnum" size="1" onChange="showimage()">';
			'\n<option value="dCoreIMG_core/xx.gif">Choose Template';
			iterate: (dCoreAPI_appTmpl: 'category'), local:'secTmplInfo';	
				if: dCoreModTag_security->templateWrite:(#secTmplInfo->get:2)->(find: $sess_usergroup)->size == 0;
					local:'stringTmpl' = (#secTmplInfo->get:2)->(split:'_');
												
					'\n<option value="' + (#secTmplInfo->get:2) + '.lassoapp?-responselassoapp=' + 'dCoreTmpl_category_img_' + (#stringTmpl->get:3) + '.gif';
					'">' + (dCoreAPI_runTag->name:(#secTmplInfo->get:2));
				/if;
			/iterate;
			'\n</select>';
			'\n</td>';
		'\n</tr>';
			
		'\n</table>';
		'\n<br><img src="dCoreIMG_core/xx.gif" name="con_imgs" width="240" height="250" border="0">';
				
		
	'\n</td>';
	'\n</tr>';
	'\n<tr>';
	'\n<td valign="top" colspan="2">';
		'\n<table border="0" width="746" cellpadding="2" cellspacing="1" >';
			'\n<tr>';
				'\n<td  colspan="2" align="center" nowrap>';
				
				'\n</td>';
			'\n</tr>';
			
		'\n</table>';
	'\n</td>';
	
	'\n</tr>';
	'\n<tr>';
		'\n<td valign="top" width="746" colspan="2">';
			'\n<input type="submit"  value="Select Template">';
				
		'\n</td>';
	'\n</tr>';
	'\n</table>';
	
		
		
	'\n</form>';

else;


'\n<table border="0" width="746" cellpadding="0" cellspacing="0">';
		
	'\n<tr>';
	'\n<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Accatr') + '" method="post"  name="con_form" onsubmit="return submitForm();">';
	'\n<input type="hidden" name="sessup" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), '1') + '">';
	'\n<input type="hidden" name="template" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),((var:'tmplnum')->split:'.lassoapp'->get:1)) + '">';
	'\n<input type="hidden" name="sectnum" value="' + (var:'sectnum') + '">';
	'\n<td valign="top" width="500">';
	include:(LassoApp_Link:'adm_category_ae_layout.lasso');

	'\n</td>';
	'\n</tr>';
	'\n<tr>';
	'\n<td valign="top" width="746">';
		'\n<input type="submit"  value="Create categories">';

		
	'\n</td>';
	'\n</tr>';
'\n</table>';
'\n</form>';

/if;
?>