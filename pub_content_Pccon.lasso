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


'<p class="' + (dCoreModTag_tmplClass->content) + '"><b>Create Content</b></p>';

local:'dCoreCategories' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnumCcon'))))),(dcoremodtag_core_categories->setFields)->second));
local:'dCoreContent' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(dcoremodtag_core_content->setFields)->second));
local:'dCoreContentLink' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(dCoreModTag_core_links->setFields)->second));








if: (var:'tmplnum') == '';

	
	'<form enctype="multipart/form-data" action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Pccon') + '" method="post" name="con_form">';
	'<input type="hidden" name="sectnumCcon" value="' + (var:'sectnumCcon') + '">';
	'<input type="hidden" name="catnumCcon" value="' + (var:'catnumCcon') + '">';

	'<table border="0" width="482">';
	
	'<tr valign="top">';
	'<td valign="top" >';
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white">';
			'\n<table border="0" width="100%" cellpadding="2" bgcolor="#ffffff">';
		'\n<tr>';
			
			'<td valign="top" height="255">';
			'<b>Section Name:</b>';
			'<br>';
			dCoreModTag_core_sections->getTitle:(#dCoreCategories->get:3->get:1->get:4)->get:1;
			'<br>';'<br>';
			'<b>Category Name:</b>';
			'<br>';
			(#dCoreCategories->get:3->get:1->get:2);
			'<br>';'<br>';
			'<b>Category Template:</b>';
			'<br>';
			dCoreAPI_runTag->name:(#dCoreCategories->get:3->get:1->get:5);
			'<br>';'<br>';
			
			'</td>';
		'</tr>';
			
		'</table>';'</td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	'<td valign="top" >';
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
		'<table border="0" width="482" cellpadding="2" cellspacing="1" >';
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
	

	'\n<form enctype="multipart/form-data" action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Pcconr') + '" method="post"  name="con_form">';
	
	include:(LassoApp_Link:'Pub_content_ae_layout.lasso');
	
	'\n<input type="hidden" name="template" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),((var:'tmplnum')->split:'.lassoapp'->get:1)) + '">';
	'\n<input type="hidden" name="catnumCcon" value="' + (var:'catnumCcon') + '">';
		'\n<input type="hidden" name="sectnumCcon" value="' + (var:'sectnumCcon') + '">';
	'\n<table border="0" width="100%">';
		
		'\n<tr>';
		'\n<td valign="top" width="100%">';
			'\n<input type="submit"  value="Submit For Approval">';
	
			
		'\n</td>';
		'\n</tr>';
	'\n</table>';
	'\n</form>';

/if;
?>