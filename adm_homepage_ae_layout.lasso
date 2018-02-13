<?lassoscript
/*#######################################################################
#									#
#	Application: 	dCore						#
#	Version: 	1.9.5						#
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
		dCoreModTag_hd746rust:'Homepage Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" size="70" name="title" value="' + (#dCoreHomepage->get:3->get:1->get:2) + '"></td>';
		'</tr>';
		'</table>';
		
		dCoreModTag_hd500Grey:'Homepage Text',-encodenone;
		'<table border="0" width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="20" name="text">';(#dCoreHomepage->get:3->get:1->get:4);'</textarea></td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Content Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Text Mode:</b></td>';
				'<td bgcolor="white" align="center">';
				'<select name="mode">';
				'<option value="text">Select';
				'<option value="text"';
				if: (#dCoreHomepage->get:3->get:1->get:5) == 'text';
					' selected ';
				/if;
				'>TEXT';
				'<option value="html"';
				if: (#dCoreHomepage->get:3->get:1->get:5) == 'html';
					' selected ';
				/if;
				'>HTML';
				if: ($sess_userGroup == '1');
					'<option value="ldml"';
					if: (#dCoreHomepage->get:3->get:1->get:5) == 'ldml';
						' selected ';
					/if;
					'>LDML';
				/if;
				'</select>';
				'</td>';
			'</tr>';
			
		'</table>';
		dCoreModTag_hd241Grey:'HomePage Template',-encodenone;
		
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'\n<tr>';
			'\n<td valign="top" nowrap bgcolor=white>';
			if: (dCoreAPI_appTmpl: 'homepage')->size > 0;
				'<select name="template" size="1" onChange="showimage()">';
					'<option value="dCoreIMG_core/xx.gif">Choose Template';
					iterate: (dCoreAPI_appTmpl: 'homepage'), local:'homeTmplInfo';	
						if: dCoreModTag_security->templateWrite:(#homeTmplInfo->get:2)->(find: $sess_usergroup)->size == 0;
							
							local:'stringTmpl' = (#homeTmplInfo->get:2)->(split:'_');						
							'<option value="' + (#homeTmplInfo->get:2) + '.lassoapp?-responselassoapp=' + 'dCoreTmpl_homepage_img_' + (#stringTmpl->get:3) + '.gif';
							'"';
							if: (#homeTmplInfo->get:2) == (#dCoreHomepage->get:3->get:1->get:3);
								'selected';
								
							/if;
							'>' + (dCoreAPI_runTag->name:(#homeTmplInfo->get:2));
							
						/if;
					/iterate;
					'</select>';
			else;
				'No Templates Enabled';
			/if;
			'\n</td></tr>';
			'\n</table>';
			'<table border="0" width="241" cellpadding="2" cellspacing="1">';
			'<tr><td bgcolor=white width=235>';
			'<img src="dCoreIMG_core/xx.gif" name="con_imgs" width="235" height="250" border="0">';
			'</td>';
			'\n</tr>';
			
		'\n</table>';
				
		
	'</td>';
	
	'</tr>';
		
'</table>';

	
?>

