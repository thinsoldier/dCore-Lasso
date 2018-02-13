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
	'<td valign="top" colspan="2" rowspan="2">';
			dCoreModTag_hd746Blue:'Account Detail',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="746">';
				'<tr valign="top">';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>#Acct. No:</b></td>';
				'<td bgcolor="white" align="left"><input type="text" name="accNo" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:11) + '"></td>';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>User Group:</b></td>';
				if: ($sess_userGroup == '1');
					'<td bgcolor="white" align="left">' + (dcoreModAPI_HTML_SelectBoxPair: (pair:'ugnum'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$ugnum)),(dCoreModTag_core_userGroups->getapproved)) +  '</td>';
				else;
					'<td bgcolor="white" align="left">&nbsp;&nbsp;' + dCoremodtag_core_userGroups->getTitle:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$ugnum)->get:1 +  '</td>';
				/if;
				
				'</tr>';
				'<tr valign="top">';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Account Type:</b></td>';
				'<td bgcolor="white" align="left">';
				if: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'acc')) != 'addChild';
					'<select name="accType">';
					
					'<option value="Parent"';
					if: (#dCoreUserRecord->get:3->get:1->get:12) == 'Parent';
						' selected';
					/if;
					'>Parent';
					if: $pg != 'Acu';
					'<option value="Child"';
						if: (#dCoreUserRecord->get:3->get:1->get:12) == 'Child';
							' selected';
						/if;
						'>Child';
					/if;
					'</select>';
				else;
					'<input type=hidden name=accType value=Child>';
					'&nbsp;Child';
				/if;
				'</td>';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Company:</b></td>';
				'<td bgcolor="white" align="left"><input type="text"  name="company" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:29) + '"></td>';
				'</tr>';
								
			'</table>';
			'<font size="-1"></font>';
			dCoreModTag_hd746Grey:'Account Contact',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="746">';
				
				'<tr valign="top">';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>First Name:</b></td>';
				'<td bgcolor="white" align="left"><input type="text"  name="firstname" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:4) + '"></td>';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Last Name:</b></td>';
				'<td bgcolor="white" align="left"><input type="text"  name="lastname" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:5) + '"></td>';
				'</tr>';
				'<tr valign="top">';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Date of Birth:</b></td>';
				'<td bgcolor="white" align="left"><input type="text"  name="dob" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:14) + '"></td>';
				'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Telephone:</b></td>';
				'<td bgcolor="white" align="left"><input type="text"  name="telephone" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:25) + '"></td>';
				'</tr>';
				
				
				
			'</table>';
		'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Account Status',-encodenone;
		'<table border="0" width="241" cellpadding="0" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			'<select name="approved">';
			'<option value="0"';
			if: (#dCoreUserRecord->get:3->get:1->get:27) != '1';
				'selected ';
			/if;
			'>No';
			'<option value="1"';
			if: (#dCoreUserRecord->get:3->get:1->get:27) == '1';
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
		

	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Access Settings',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="241">';
			
			
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Log-In</td>';
				'<td bgcolor="white" align="left">';
				'<select name="login">';
				'<option value="0"';
				if: (#dCoreUserRecord->get:3->get:1->get:15) != '1';
					' selected ';
				/if;
				'>Disabled';
				if: (dCoreModTag_perms_userGroups->login)->find:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))->size > 0;
					'<option value="1"';
					if: (#dCoreUserRecord->get:3->get:1->get:15) == '1';
						'selected ';
					/if;
					'>Enabled';
				/if;
				'</select>';
				'</td>';
				
			'</tr>';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Password</td>';
				'<td bgcolor="white" align="left">';
				'<input type="password" name="password" value="' + (#dCoreUserRecord->get:3->get:1->get:9) + '">';
				'</td>';
				
			'</tr>';
			
			local:'getID' = (#dCoreUserRecord->get:3->get:1->get:1);
			local:'getType' = (#dCoreUserRecord->get:3->get:1->get:12);
			local:'getAcc' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'acc'));
			
			if: (((#getID) == '') || ((#getType) == 'Parent')) && ((#getAcc) != 'addChild');
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Child Accounts</td>';
					'<td bgcolor="white" align="left">';
					'<input type="accMax" name="accMax" value="';
					if: (#dCoreUserRecord->get:3->get:1->get:13) == '';
						'0';
					else;
						(#dCoreUserRecord->get:3->get:1->get:13);
					/if;
					'" size=5>';
					'</td>';
					
				'</tr>';
			else;
				local:'parentUser' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$uanum)))),(array:'id','user_firstname','user_lastname','usergroup_id','user_master')));
				if: (#parentUser->get:3->get:1->get:5) != '';
				local:'parentUser' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'=(#parentUser->get:3->get:1->get:5)))),(array:'id','user_firstname','user_lastname','usergroup_id','user_master')));
				/if;
				
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Parent Account</td>';
					'<td bgcolor="white" align="left">';
					'<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#parentUser->get:3->get:1->get:1)) + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#parentUser->get:3->get:1->get:4)) + '" class="body">' + (#parentUser->get:3->get:1->get:2) + ' ' + (#parentUser->get:3->get:1->get:3) + '</a>';
					'<input type="hidden" name="masterAcc" value="'  + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#parentUser->get:3->get:1->get:1)) + '">';
					'</td>';
					
				'</tr>';
			/if;
			'</table>';
	'</td>';
	'</tr>';
	
	'<tr valign="top">';
		'<td valign="top" colspan="2">';
		dCoreModTag_hd746Grey:'Account Address',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="746">';
		'<tr valign="top">';
			'<td bgcolor="white" width="110" align="left">&nbsp;&nbsp;<b>Number:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="streetno" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:19) + '"></td>';
			'<td bgcolor="white" width="110" align="left">&nbsp;&nbsp;<b>Street:</b></td>';
			'<td bgcolor="white" align="left"><input type="text"  name="street" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:20) + '"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" width="110" align="left">&nbsp;&nbsp;<b>Region:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="state" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:22) + '"></td>';
			'<td bgcolor="white" width="110" align="left">&nbsp;&nbsp;<b>Zip Code:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="zip" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:23) + '"></td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" width="110" align="left">&nbsp;&nbsp;<b>PO Box:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="pobox" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:30) + '"></td>';
			'<td bgcolor="white" width="110" align="left">&nbsp;&nbsp;<b>Country:</b></td>';
			'<td bgcolor="white" align="left">';
			dcoreModAPI_HTML_SelectBoxPair: (pair:'country'=(#dCoreUserRecord->get:3->get:1->get:24)),dCoreAPI_countryList;
			'</td>';
		'</tr>';
		'</table>';
		'</td>';
		
	'<td valign="top" width="241" rowspan="2">';
		dCoreModTag_hd241Grey:'Account Permissions',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="241">';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Read</td>';
				'<td bgcolor="white" align="center" width="90">';
				'<select name="read">';
				'<option value="0"';
				if: (#dCoreUserRecordPerms->get:3->get:1->get:3) != '1';
					'selected ';
				/if;
				'>Deny';
				if: (dCoreModTag_perms_userGroups->read)->find:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))->size > 0;
					'<option value="1"';
					if: (#dCoreUserRecordPerms->get:3->get:1->get:3) == '1';
						'selected ';
					/if;
					'>Allow';
				/if;
				'</select>';
				'</td>';
			
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Write</td>';
				'<td bgcolor="white" align="center" width="90">';
				'<select name="write">';
				'<option value="0"';
				if: (#dCoreUserRecordPerms->get:3->get:1->get:4) != '1';
					'selected ';
				/if;
				'>Deny';
				if: (dCoreModTag_perms_userGroups->write)->find:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))->size > 0;
					'<option value="1"';
					if: (#dCoreUserRecordPerms->get:3->get:1->get:4) == '1';
						'selected ';
					/if;
					'>Allow';
				/if;
				'</select>';
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Edit</td>';
				'<td bgcolor="white" align="center" width="90">';
				'<select name="edit">';
				'<option value="0"';
				if: (#dCoreUserRecordPerms->get:3->get:1->get:5) != '1';
					'selected ';
				/if;
				'>Deny';
				if: (dCoreModTag_perms_userGroups->edit)->find:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))->size > 0;
					'<option value="1"';
					if: (#dCoreUserRecordPerms->get:3->get:1->get:5) == '1';
						'selected ';
					/if;
					'>Allow';
				/if;
				'</select>';
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Delete</td>';
				'<td bgcolor="white" align="center" width="90">';
				'<select name="delete">';
				'<option value="0"';
				if: (#dCoreUserRecordPerms->get:3->get:1->get:6) != '1';
					'selected ';
				/if;
				'>Deny';
				if: (dCoreModTag_perms_userGroups->delete)->find:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))->size > 0;
					'<option value="1"';
					if: (#dCoreUserRecordPerms->get:3->get:1->get:6) == '1';
						'selected ';
					/if;
					'>Allow';
				/if;
				'</select>';
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Upload</td>';
				'<td bgcolor="white" align="center" width="90">';
				'<select name="upload">';
				'<option value="0"';
				if: (#dCoreUserRecordPerms->get:3->get:1->get:7) != '1';
					'selected ';
				/if;
				'>Deny';
				if: (dCoreModTag_perms_userGroups->upload)->find:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))->size > 0;
					'<option value="1"';
					if: (#dCoreUserRecordPerms->get:3->get:1->get:7) == '1';
						'selected ';
					/if;
					'>Allow';
				/if;
				'</select>';
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Moderator</td>';
				'<td bgcolor="white" align="center" width="90">';
				'<select name="moderator">';
				'<option value="0"';
				if: (#dCoreUserRecordPerms->get:3->get:1->get:8) != '1';
					'selected ';
				/if;
				'>Deny';
				if: (dCoreModTag_perms_userGroups->moderator)->find:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))->size > 0;
					'<option value="1"';
					if: (#dCoreUserRecordPerms->get:3->get:1->get:8) == '1';
						'selected ';
					/if;
					'>Allow';
				/if;
				'</select>';
				'</td>';
				
			'</tr>';
			
			'</table>';
	'</td>';
	'</tr>';
	'<tr valign="top">';
		'<td valign="top">';
		dCoreModTag_hd500Grey:'Email Account',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="500">';
		'<tr valign="top">';
			'<td bgcolor="white" width="110" align="left">&nbsp;&nbsp;<b>Email Address:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="emailaddress" size="55" value="' + (#dCoreUserRecord->get:3->get:1->get:8) + '"></td>';
		'</tr>';
		
		'</table>';
		'</td>';
		'<td valign="top" rowspan="4">';
		dCoreModTag_hd241Grey:'Picture',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="241" height="180">';
		'<tr valign="top">';
			'<td bgcolor="white" align="center" valign="middle">';
			'<input type="hidden" name="picture" value="'+(#dCoreUserRecord->get:3->get:1->get:16)+'">';
			'<img src="';
			if: (#dCoreUserRecord->get:3->get:1->get:16) != '';
				(dCoreModTag_core_appinfo->getURLPath:'1') +  (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCorePictures/' + (#dCoreUserRecord->get:3->get:1->get:16);
			else;
				'dCoreIMG_core/icon_noimage.gif';
			/if;
			'" border="0"></td>';
		'</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="center" valign="middle"><input type="file" name="file"></td>';
		'</td>';
		'</tr>';
		'</table>';
		'</td>';
	'</tr>';
	'<tr valign="top">';
		'<td valign="top" colspan="2" rowspan="3">';
		dCoreModTag_hd500Grey:'Security Questions',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="500">';
		
		
		'<tr valign="top">';
			'<td bgcolor="white" align="left">&nbsp;&nbsp;<b>Question 1:</b></td>';
			'<td bgcolor="white" align="left">';
			'<select name="secQuestionOne">';
			iterate: (dCoreModTag_dropdownField:'user_secQuestionOne'), local:'dropdownFieldInfo';
			'<option value="';
			(#dropdownFieldInfo->split:'='->get:1);
			'"';
			if: (#dCoreUserRecord->get:3->get:1->get:32) == (#dropdownFieldInfo->split:'='->get:1);
				' selected';
			/if;
			'>' + (#dropdownFieldInfo->split:'='->get:2);
			/iterate;
			'</select>';
			'</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left">&nbsp;&nbsp;<b>Answer:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="secAnswerOne" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:35) + '"></td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left">&nbsp;&nbsp;<b>Question 2:</b></td>';
			'<td bgcolor="white" align="left">';
			'<select name="secQuestionTwo">';
			iterate: (dCoreModTag_dropdownField:'user_secQuestionTwo'), local:'dropdownFieldInfo';
			'<option value="';
			(#dropdownFieldInfo->split:'='->get:1);
			'"';
			if: (#dCoreUserRecord->get:3->get:1->get:33) == (#dropdownFieldInfo->split:'='->get:1);
				' selected';
			/if;
			'>' + (#dropdownFieldInfo->split:'='->get:2);
			/iterate;
			'</select>';
			'</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left">&nbsp;&nbsp;<b>Answer:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="secAnswerTwo" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:36) + '"></td>';
			
			'<tr valign="top">';
			'<td bgcolor="white" align="left">&nbsp;&nbsp;<b>Question 3:</b></td>';
			'<td bgcolor="white" align="left">';
			'<select name="secQuestionThree">';
			iterate: (dCoreModTag_dropdownField:'user_secQuestionThree'), local:'dropdownFieldInfo';
			'<option value="';
			(#dropdownFieldInfo->split:'='->get:1);
			'"';
			if: (#dCoreUserRecord->get:3->get:1->get:34) == (#dropdownFieldInfo->split:'='->get:1);
				' selected';
			/if;
			'>' + (#dropdownFieldInfo->split:'='->get:2);
			/iterate;
			'</select>';
			'</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left">&nbsp;&nbsp;<b>Answer:</b></td>';
			'<td bgcolor="white" align="left"><input type="text" name="secAnswerThree" size="45" value="' + (#dCoreUserRecord->get:3->get:1->get:37) + '"></td>';
			
		'</tr>';
		'</tr>';
		'</table>';
		'</td>';
	'</tr>';
'</table>';

?>

