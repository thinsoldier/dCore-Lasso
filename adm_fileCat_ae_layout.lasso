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
		dCoreModTag_hd746Orange:'File Category Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" size="70" name="name" value="' + (#dCoreFileCat->get:3->get:1->get:2) + '"></td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	'<td valign="top" width="241"  rowspan="2">';
		dCoreModTag_hd241Grey:'Category Settings',-encodenone;
		'<table border="0" width="241" cellpadding="0" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			'<select name="approved">';
			'<option value="0">Select';
				'<option value="0"';
				if: (#dCoreFileCat->get:3->get:1->get:3) != '1';
					'selected ';
				/if;
				'>No';
				'<option value="1"';
				if: (#dCoreFileCat->get:3->get:1->get:3) == '1';
					'selected ';
				/if;
				'>Yes';
			'</select>';
			'</td>';
			'</tr>';
			
		'</table>';
		
		
		
	'</td>';
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" colspan="2" width="746">';
		dCoreModTag_hd746Grey:'File Category Description',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="10" name="text">';(#dCoreFileCat->get:3->get:1->get:4);'</textarea></td>';
		'</tr>';
			
		'</table>';
	'</td>';
	/*
		'<td valign="top" width="241">';
			
			dCoreModTag_hd241Grey:'File Extensions',-encodenone;
			'<table border="0" width="241" cellpadding="0" cellspacing="1" bgcolor="#000000">';
			'<tr valign="top">';
				'<td bgcolor="white" width="20" align="left" nowrap>&nbsp;<input type="checkbox" name="fType" value="img"></td>';
				'<td bgcolor="white" align="center" width="90">&nbsp;Image</td>';
			'</tr>';
			'<tr>';
				'<td bgcolor="white" align="left" nowrap>&nbsp;<input type="checkbox" name="fType" value="doc"></td>';
				'<td bgcolor="white" align="center" width="90">&nbsp;Non-Image</td>';
				'</tr>';
				
			'</table>';
			
			
			
		'</td>';
	*/
	'</tr>';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Grey:'File Category Access Permissions',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		
		'<tr valign="top">';
			'<td bgcolor="#ffffff" width="150"><b>User Group</b></td>';
			'<td bgcolor="#ffffff" width="60" align="center"><b>Upload</b></td>';
		'</tr>';
		'<tr>';
				'<td bgcolor="#ffffff" width="150"><b>Pubic</b></td>';
			
				'</td>';
				
				'<td bgcolor="#ffffff" width="60" align="center">';
					'<input type="checkbox" name="upload" value="_0"';
					if: (dCoreModTag_perms_fileCat->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$fcatnum))->find: ('_0')->size > 0;' checked';/if;
					'>';
				
				'</td>';
				
			'</tr>';
		iterate: dCoreModTag_core_userGroups->getAll, local:'getAllItem';
			if: #getAllItem->get:2 != 'Administrator';
				'<tr>';
					'<td bgcolor="#ffffff" width="150"><b>' + #getAllItem->get:2 + '</b></td>';
					
					'<td bgcolor="#ffffff" width="60" align="center">';
					if: (dCoreModTag_perms_userGroups->upload)->(find:#getAllItem->get:1)->size > 0;
						'<input type="checkbox" name="upload" value="' + (#getAllItem->get:1) + '"';
						if: (dCoreModTag_perms_fileCat->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$fcatnum))->find: (#getAllItem->get:1)->size > 0;' checked';/if;
						'>';
					else;
						'<img src="dCoreIMG_core/icon_cross.gif">';
					/if;
					'</td>';
					
				'</tr>';
			else;
			
				'<input type="hidden" name="upload" value="' + (#getAllItem->get:1) + '">';
				
			/if;
		/iterate;
		'</table>';
	'</td>';
	'</tr>';		
'</table>';

	
?>

