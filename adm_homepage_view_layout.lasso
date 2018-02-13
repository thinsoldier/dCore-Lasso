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
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Rust:'Homepage Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreHomepage->get:3->get:1->get:2) + '</td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Tasks',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aehp') + '&hpnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreHomepage->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aehp') + '&hpnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreHomepage->get:3->get:1->get:1)+'" class="body">Edit Homepage</a></td>';
					
		'</tr>';
		'</table>';
	'</td>';
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="746" rowspan="2" colspan="2">';
		dCoreModTag_hd746Grey:'Homepage Text',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff" class="body">';(dCoreAPI_textMode:(#dCoreHomepage->get:3->get:1->get:4), (#dCoreHomepage->get:3->get:1->get:5));'</td>';
		'</tr>';
			
		'</table>';
	'</td>';
	
	
	'<td valign="top">';
	dCoreModTag_hd241Grey:'Content Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		
		
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Text Mode:</b></td>';
				'<td bgcolor="white" align="center">';
				string_uppercase:(#dCoreHomepage->get:3->get:1->get:5);
				'</td>';
				
			'</tr>';
			
			
		
		'</table>';
		
		dCoreModTag_hd241Grey:'Template Appearance',-encodenone;
		'<table>';
			'<tr valign="top">';
			
				'<td align="center">';
				if: (#dCoreHomepage->get:3->get:1->get:3) >> 'tmpl_homepage';
					local:'stringTmpl' = (#dCoreHomepage->get:3->get:1->get:3)->(split:'_');						
					'<img src="';
					(#dCoreHomepage->get:3->get:1->get:3) + '.lassoapp?-responselassoapp=' + 'dCoreTmpl_homepage_img_' + (#stringTmpl->get:3) + '.gif';
					'" border="0" width="240" height="280">';
				/if;
			'</td></tr>';
			
		'</table>';
		'</td>';
	'</tr>';
	
'</table>';

	
?>

