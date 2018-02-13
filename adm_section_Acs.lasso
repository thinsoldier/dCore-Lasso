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


if: (var:'tmplnum') == '';

	
	
	'\n<table border="0" width="746">';
	
	'\n<tr>';
	'\n<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acs') + '" method="post" name="con_form"   onsubmit="return submitForm();">';
	'\n<td valign="top" >';
		dCoreModTag_hd746Green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" class="title">Select Template</a>',-encodenone;
		'\n<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'\n<tr>';
			'\n<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Template:</b></td>';
			'\n<td bgcolor="white">';
			'\n<select name="tmplnum" size="1" onChange="showimage()">';
			'\n<option value="dCoreIMG_core/xx.gif">Choose Template';
				
				iterate: (dCoreAPI_appTmpl: 'section'), local:'secTmplInfo';
					if: dCoreModTag_security->templateWrite:(#secTmplInfo->get:2)->(find: $sess_usergroup)->size == 0;
					
						local:'stringTmpl' = (#secTmplInfo->get:2)->(split:'_');
						local:'stringValue' = (#secTmplInfo->get:2) + '.lassoapp?-responselassoapp=' + 'dCoreTmpl_section_img_' + (#stringTmpl->get:3) + '.gif';
						
						'\n<option value="' + (string:#stringValue) + '">' + (dCoreAPI_runTag->name:(#secTmplInfo->get:2));
					/if;
				/iterate;
			
			'\n</select>';
			'\n</td>';
		'\n</tr>';
			
		'\n</table>';
		
		
	'\n</td>';
	'\n</tr>';
	'\n<tr>';
	'\n<td valign="top">';
		'\n<table border="0" width="746" cellpadding="2" cellspacing="1" >';
			'\n<tr>';
				'\n<td  colspan="2" align="center" nowrap>';
				
				'\n<img src="dCoreIMG_core/xx.gif" name="con_imgs" width="240" height="250" border="1"><br><br>';
				
				'\n</td>';
			'\n</tr>';
			
		'\n</table>';
	'\n</td>';
	
	'\n</tr>';
	'\n</table>';
	
		
		'\n<tr>';
		'\n<td valign="top" width="500">';
			'\n<input type="submit"  value="Select Template">';
				
		'\n</td>';
	'\n</form>';

else;

	
	
	'\n<table border="0" width="746" cellpadding="0" cellspacing="0">';
		'\n<tr>';
			'<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acsr') + '" method="post"  name="con_form" onsubmit="return submitForm();">';
			'\n<input type="hidden" name="sessup" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), '1') + '">';
			'\n<input type="hidden" name="template" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),((var:'tmplnum')->split:'.lassoapp'->get:1)) + '">';
		'\n<td valign="top" width="746">';
		include:(LassoApp_Link:'adm_section_ae_layout.lasso');
	
			
		'\n</td>';
		'\n</tr>';
		'\n<tr>';
		'\n<td valign="top" width="746">';
			'\n<input type="submit"  value="Create Section">';
		'\n</td>';
		'\n</tr>';
	'\n</table>';
'\n</form>';

/if;
?>