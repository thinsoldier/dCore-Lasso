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
	'<td valign="top" width="746">';
		dCoreModTag_hd746Blue:'User Group Detail',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Name:</b></td>';
			'<td bgcolor="white" align="left">';
			if: (dCoreModTag_core_userGroups)->getTitle:((#dCoreFoundSet->get:3->get:1->get:1))->get:1 != 'Administrator';
	
				'<input type="text" size="70" name="title" value="' + (#dCoreFoundSet->get:3->get:1->get:2) + '">';
			else;
				'Administrator';
				'<input type="hidden" size="70" name="title" value="Administrator">';
			/if;
			'</td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	'<td valign="top" width="241">';
			dCoreModTag_hd241Grey:'User Group Status',-encodenone;
			'<table border="0" width="241" cellpadding="0" cellspacing="1" bgcolor="#000000">';
			'<tr valign="top">';
				'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
				'<td bgcolor="white" align="center" width="90">';
					'<select name="approved">';
					'<option value="0"';
					if: (#dCoreFoundSet->get:3->get:1->get:3) != '1';
						'selected ';
					/if;
					'>No';
				
					'<option value="1"';
					if: (#dCoreFoundSet->get:3->get:1->get:3) == '1';
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
	'<td valign="top" width="746"  rowspan="2">';
		dCoreModTag_hd746Grey:'Description',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="15" name="text">';(#dCoreFoundSet->get:3->get:1->get:4);'</textarea></td>';
		'</tr>';
			
		'</table>';
	'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Settings',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="241">';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Create Account</td>';
				'<td bgcolor="white" align="center">';
				'<select name="createAccount">';
				'<option value="0"';
				if: (#dCoreFoundSet->get:3->get:1->get:7) != '1';
					' selected ';
				/if;
				'>Disabled';
				'<option value="1"';
				if: (#dCoreFoundSet->get:3->get:1->get:7) == '1';
					' selected ';
				/if;
				'>Enabled';
				'</select>';
				'</td>';
			
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Account Approval</td>';
				'<td bgcolor="white" align="center">';
				'<select name="approvalAccount">';
				'<option value="0"';
				if: (#dCoreFoundSet->get:3->get:1->get:11) != '1';
					' selected ';
				/if;
				'>Disabled';
				'<option value="1"';
				if: (#dCoreFoundSet->get:3->get:1->get:11) == '1';
					' selected ';
				/if;
				'>Enabled';
				'</select>';
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Log-In</td>';
				'<td bgcolor="white" align="center">';
				'<select name="login">';
				'<option value="0"';
				if: (#dCoreFoundSet->get:3->get:1->get:8) != '1';
					' selected ';
				/if;
				'>Disabled';
				'<option value="1"';
				if: (#dCoreFoundSet->get:3->get:1->get:8) == '1';
					' selected ';
				/if;
				'>Enabled';
				'</select>';
				'</td>';
				
			'</tr>';
			'</table>';
	'</td>';
	'</tr>';
	
	if: (dCoreModTag_core_userGroups)->getTitle:((#dCoreFoundSet->get:3->get:1->get:1))->get:1 != 'Administrator';
		'<tr valign="top">';
		'<td valign="top" width="241">';
			dCoreModTag_hd241Grey:'Permissions',-encodenone;
				'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="241">';
				
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Read</td>';
					'<td bgcolor="white" align="center" width="90">';
					'<select name="read">';
					'<option value="0"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:3) != '1';
						'selected ';
					/if;
					'>Deny';
					'<option value="1"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:3) == '1';
						'selected ';
					/if;
					'>Allow';
					'</select>';
					'</td>';
				
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Write</td>';
					'<td bgcolor="white" align="center" width="90">';
					'<select name="write">';
					'<option value="0"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:4) != '1';
						'selected ';
					/if;
					'>Deny';
					'<option value="1"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:4) == '1';
						'selected ';
					/if;
					'>Allow';
					'</select>';
					'</td>';
					
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Edit</td>';
					'<td bgcolor="white" align="center" width="90">';
					'<select name="edit">';
					'<option value="0"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:5) != '1';
						'selected ';
					/if;
					'>Deny';
					'<option value="1"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:5) == '1';
						'selected ';
					/if;
					'>Allow';
					'</select>';
					'</td>';
					
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Delete</td>';
					'<td bgcolor="white" align="center" width="90">';
					'<select name="delete">';
					'<option value="0"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:6) != '1';
						'selected ';
					/if;
					'>Deny';
					'<option value="1"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:6) == '1';
						'selected ';
					/if;
					'>Allow';
					'</select>';
					'</td>';
					
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Upload</td>';
					'<td bgcolor="white" align="center" width="90">';
					'<select name="upload">';
					'<option value="0"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:7) != '1';
						'selected ';
					/if;
					'>Deny';
					'<option value="1"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:7) == '1';
						'selected ';
					/if;
					'>Allow';
					'</select>';
					'</td>';
					
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Moderator</td>';
					'<td bgcolor="white" align="center" width="90">';
					'<select name="moderator">';
					'<option value="0"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:8) != '1';
						'selected ';
					/if;
					'>Deny';
					'<option value="1"';
					if: (#dCoreFoundSetPerms->get:3->get:1->get:8) == '1';
						'selected ';
					/if;
					'>Allow';
					'</select>';
					'</td>';
					
				'</tr>';
				
				'</table>';
		'</td>';
		'</tr>';
	else;
	'<tr valign="top">';
		'<td valign="top" width="241">';
		
				'<input type="hidden" name="read" value="1">';
				'<input type="hidden" name="write" value="1">';
				'<input type="hidden" name="edit" value="1">';
				'<input type="hidden" name="delete" value="1">';
				'<input type="hidden" name="upload" value="1">';
				'<input type="hidden" name="moderator" value="1">';
		'</td>';
	'</tr>';
				
	/if;
	'<tr valign="top">';
	'<td valign="top" width="746" rowspan="3">';
		dCoreModTag_hd746Grey:'User Terms',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="#ffffff" colspan="2" align="left" nowrap>&nbsp;<input type="checkbox" name="terms_option" value="1"';
			if: (#dCoreFoundSet->get:3->get:1->get:6) == '1';
				'checked ';
			/if;
			'>&nbsp;Enable User Terms</td>';
		'</tr>';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff"><textarea cols="100" rows="7" name="terms">';(#dCoreFoundSet->get:3->get:1->get:5);'</textarea></td>';
		'</tr>';
			
		'</table>';
	'</td>';
	
	'</tr>';
'</table>';
?>

