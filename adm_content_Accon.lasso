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



							
local:'dCoreCategories' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum'))))),(dcoremodtag_core_categories->setFields)->second));
if: (var:'errorDupe') != '1';
	local:'dCoreContent' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(dcoremodtag_core_content->setFields)->second));
	
/if;
	local:'dCoreContentLink' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(dCoreModTag_core_links->setFields)->second));


if: (var:'tmplnum') == '';

	
	'<form enctype="multipart/form-data" action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Accon') + '" method="post" name="con_form">';
	'<input type="hidden" name="sectnum" value="' + (var:'sectnum') + '">';
	'<input type="hidden" name="catnum" value="' + (var:'catnum') + '">';
	
	'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" >';
		dCoreModTag_hd500Green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" class="title">Category Information</a>',-encodenone;
		'<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white">';
			'\n<table border="0" width="100%" cellpadding="2" bgcolor="#ffffff">';
		'\n<tr>';
			'\n<td>';
				'<img src="';
				local:'stringTmpl' = (#dCoreCategories->get:3->get:1->get:5)->(split:'_');
				
				(#dCoreCategories->get:3->get:1->get:5)+ '.lassoapp?-responselassoapp=' + 'dCoreTmpl_category_img_' + (#stringTmpl->get:3) + '.gif';
				'" border="0">';
				
			'\n</td>';
			'<td valign="top">';
			'&nbsp;<br><b>Category Name:</b>';
			'<br>';
			(#dCoreCategories->get:3->get:1->get:2);
			'<br>';'<br>';
			'<b>Category Template:</b>';
			'<br>';
			dCoreAPI_runTag->name:(#dCoreCategories->get:3->get:1->get:5);
			'<br>';'<br>';
			'<b>No. of Images:  </b>';
			dCoreAPI_runTag->infoImg:(#dCoreCategories->get:3->get:1->get:5)->size;
			'<br>';
			'<br>';
			if: dCoreAPI_runTag->infoImg:(#dCoreCategories->get:3->get:1->get:5)->size > 0;
				'<b>Image Sizes: (W x H)</b><br>';
				iterate: dCoreAPI_runTag->infoImg:(#dCoreCategories->get:3->get:1->get:5), local:'imageInfo';
					'<br><b>Image ' + #imageInfo->first + ':  </b>  ' + #imageInfo->second;
				/iterate;
			/if;
			'</td>';
		'</tr>';
			
		'</table>';'</td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	'<td valign="top" >';
		dCoreModTag_hd241Green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" class="title">Content Template</a>',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white">';
			'<select name="tmplnum" size="1" onChange="showimage()">';
			'<option value="dCoreIMG_core/xx.gif">Choose Template';
			iterate: (dCoreAPI_appTmpl: 'content'), local:'conTmplInfo';	
				if: dCoreModTag_security->templateWrite:(#conTmplInfo->get:2)->(find: $sess_usergroup)->size == 0;
				
					local:'stringTmpl' = (#conTmplInfo->get:2)->(split:'_');						
					'<option value="' + (#conTmplInfo->get:2) + '.lassoapp?-responselassoapp=' + 'dCoreTmpl_content_img_' + (#stringTmpl->get:3) + '.gif';
					'">' + (dCoreAPI_runTag->name:(#conTmplInfo->get:2));
					
				/if;
			/iterate;
			'</select>';
			'</td>';
		'</tr>';
			
		'</table>';
		'<br><img src="dCoreIMG_core/xx.gif" name="con_imgs" width="240" height="250" border="0">';
				
		
	'</td>';
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" colspan="2">';
		'<table border="0" width="746" cellpadding="2" cellspacing="1" >';
			'<tr valign="top">';
				'<td  colspan="2" align="center" nowrap>';
				
				'</td>';
			'</tr>';
			
		'</table>';
	'</td>';
	
	'</tr>';
	'<tr valign="top">';
		'<td valign="top" width="746" colspan="2">';
			'<input type="submit"  value="Select Template">';
				
		'</td>';
	'</tr>';
	'</table>';
	
		
		
	'</form>';

else;
	
'\n<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acconr') + '" method="post"  name="con_form" onsubmit="return submitForm();">';
'<input type="hidden" name="tmplnumDupe" value="' + (var:'tmplnum') + '">';
'\n<input type="hidden" name="sessup" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), '1') + '">';

include:(LassoApp_Link:'adm_content_ae_layout.lasso');

'\n<input type="hidden" name="template" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),((var:'tmplnum')->split:'.lassoapp'->get:1)) + '">';
'\n<input type="hidden" name="catnum" value="' + (var:'catnum') + '">';
	'\n<input type="hidden" name="sectnum" value="' + (var:'sectnum') + '">';
'\n<table border="0" width="746">';
	
		'\n<tr>';
	'\n<td valign="top" width="500">';
		'\n<input type="submit"  value="Create Content">';

		
	'\n</td>';
	'\n</tr>';
'\n</table>';
'\n</form>';

/if;
?>