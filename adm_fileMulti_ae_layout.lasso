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
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb2"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb3"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb4"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb5"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb6"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb7"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb8"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb9"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><input type="file" size="50" name="fnmb10"></td>';
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
	
	
	
'</table>';

	
?>

