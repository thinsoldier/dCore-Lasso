
<?lassoscript

/*#######################################################################
#									#
#	Application: 	dCore						#
#	Version: 	1.9.6						#
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

'<table border="0" width="987">';
	
	'<tr valign="top">';
	'<td valign="top">';


'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" colspan="2" width="746">';
			dCoreModTag_hd746Blue:'Account Detail',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="746">';
				'<tr valign="top">';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>#Acct. No:</b></td>';
				'<td bgcolor="white" width="210" align="left">' + (#dCoreUserRecord->get:3->get:1->get:11) + '</td>';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>User Group:</b></td>';
				'<td bgcolor="white" align="left"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#dCoreUserRecord->get:3->get:1->get:3))+'" class="body">' + (dCoreModTag_core_userGroups->getTitle:(#dCoreUserRecord->get:3->get:1->get:3))->get:1 + '</a></td>';
				'</tr>';
				'<tr valign="top">';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Account Type:</b></td>';
				'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:12) + '</td>';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Company:</b></td>';
				'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:29) + '</td>';
				'</tr>';
								
			'</table>';
			'<font size="-1"></font>';
			dCoreModTag_hd746Grey:'Account Contact',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="746">';
				
				'<tr valign="top">';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>First Name:</b></td>';
				'<td bgcolor="white" width="210" align="left">' + (#dCoreUserRecord->get:3->get:1->get:4) + '</td>';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Last Name:</b></td>';
				'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:5) + '</td>';
				'</tr>';
				'<tr valign="top">';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Date of Birth:</b></td>';
				'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:14) + '</td>';
				'<td bgcolor="#D4D0C8" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Telephone:</b></td>';
				'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:25) + '</td>';
				'</tr>';
				
				
				
			'</table>';
		'</td>';
		
	
	'</tr>';

		
	'<tr valign="top">';
		'<td valign="top" colspan="2">';
		dCoreModTag_hd746Grey:'Account Address',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="746">';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>Number:</b></td>';
			'<td bgcolor="white" width="210" align="left">' + (#dCoreUserRecord->get:3->get:1->get:19) + '</td>';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>Street:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:20) + '</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>Region:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:22) + '</td>';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>Zip Code:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:23) + '</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>PO Box:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:30) + '</td>';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>Country:</b></td>';
			'<td bgcolor="white" align="left">';
			if: (#dCoreUserRecord->get:3->get:1->get:24) != '';
				(dCoreAPI_countryList)->get:(#dCoreUserRecord->get:3->get:1->get:24)->second;
			/if;
			'</td>';
		'</tr>';
		'</table>';
		'</td>';
		
	
	'</tr>';
	
	'<tr valign="top">';
		'<td valign="top" width="500">';
		dCoreModTag_hd500Grey:'Email Account',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="500">';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>Email Address:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:8) + '</td>';
		'</tr>';
		
		'</table>';
		
	
		'</td>';
		'<td valign="top" rowspan="2"  width="241">';
		dCoreModTag_hd241Grey:'Picture',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="0" cellspacing="1" width="241" height="180">';
		'<tr valign="top">';
			'<td bgcolor="white" align="center" valign="middle">';
			'<img src="';
			if: (#dCoreUserRecord->get:3->get:1->get:16) != '';
				(dCoreModTag_core_appinfo->getURLPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCorePictures/' + (#dCoreUserRecord->get:3->get:1->get:16);
			else;
				'dCoreIMG_core/icon_noimage.gif';
			/if;
			'" border="0"></td>';
		'</td>';
		'</tr>';
		
		'</table>';
		'</td>';
	'</tr>';
	'<tr valign="top">';
		'<td valign="top"  width="500">';
		dCoreModTag_hd500Grey:'Security Questions',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="500">';
		
		
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" width="110" align="left">&nbsp;&nbsp;<b>Question 1:</b></td>';
			'<td bgcolor="white" align="left">' + (dCoreModTag_dropdownField_value:('user_secQuestionOne'),(#dCoreUserRecord->get:3->get:1->get:32)) + '</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" align="left">&nbsp;&nbsp;<b>Answer:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:35) + '</td>';
			
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" align="left">&nbsp;&nbsp;<b>Question 2:</b></td>';
			'<td bgcolor="white" align="left">' + (dCoreModTag_dropdownField_value:('user_secQuestionTwo'),(#dCoreUserRecord->get:3->get:1->get:33)) + '</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" align="left">&nbsp;&nbsp;<b>Answer:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:36) + '</td>';
			
			'<tr valign="top">';
			'<td bgcolor="#D4D0C8" align="left">&nbsp;&nbsp;<b>Question 3:</b></td>';
			'<td bgcolor="white" align="left">' + (dCoreModTag_dropdownField_value:('user_secQuestionThree'),(#dCoreUserRecord->get:3->get:1->get:34)) + '</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="#D4D0C8" align="left">&nbsp;&nbsp;<b>Answer:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreUserRecord->get:3->get:1->get:37) + '</td>';
			
		'</tr>';
		
		
		'</table>';
		'</td>';
	'</tr>';


'</table>';

'</td>';
'<td valign=Top" width="241" align=left>';
'<table border="0" width="241">';
'<tr valign="top">';
	
'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Tasks',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			if: ((#dCoreUserRecord->get:3->get:1->get:12) == 'Parent') && ((#dCoreUserRecord->get:3->get:1->get:13) > 0) && ((integer:(dCoreModTag_core_userAccounts->childAccTotal: (#dCoreUserRecord->get:3->get:1->get:1))) < (integer:(#dCoreUserRecord->get:3->get:1->get:13)));
				'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acu') + '&acc=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),'addChild') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserRecord->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_add.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acu') + '&acc=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),'addChild') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserRecord->get:3->get:1->get:1)+ '&ugnum='+$ugnum+'" class="body">Add Child</a></td>';
			/if;
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aeu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserRecord->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aeu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserRecord->get:3->get:1->get:1)+ '&ugnum='+$ugnum+'" class="body">Edit</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserRecord->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserRecord->get:3->get:1->get:1)+ '&ugnum='+$ugnum+'" class="body">Del</a></td>';
			
			
		'</tr>';
		'</table>';
		
		
		dCoreModTag_hd241Grey:'Account Status',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="110" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center">';
			(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecord->get:3->get:1->get:27));
			'</td>';
			'</tr>';
		
		
		'</table>';
		
	'</td>';
	'</tr>';
		'<tr valign="top">';
		

	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Access Settings',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="241">';
			
			
			
			'<tr valign="top">';
				'<td bgcolor="white" width="110">&nbsp;&nbsp;<b>Log-In</td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecord->get:3->get:1->get:15));
				
				'</td>';
				
			'</tr>';
			
			'<tr valign="top">';
				'<td bgcolor="white" width="110">&nbsp;&nbsp;<b>Password</td>';
				'<td bgcolor="white" align="center">';
				'**********';
				'</td>';
				
			'</tr>';
			
			
			
			'<tr valign="top">';
				'<td bgcolor="white" width="110">&nbsp;&nbsp;<b>Validation Code</td>';
				'<td bgcolor="white" align="center">';
				if: (#dCoreUserRecord->get:3->get:1->get:38) != '';
					(#dCoreUserRecord->get:3->get:1->get:38);
				else;
					'<i>No Code</i>';
				/if;
				'</td>';
				
			'</tr>';
			
			local:'getID' = (#dCoreUserRecord->get:3->get:1->get:1);
			local:'getType' = (#dCoreUserRecord->get:3->get:1->get:12);
			local:'getAcc' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'acc'));
			
			if: (((#getID) == '') || ((#getType) == 'Parent')) && ((#getAcc) != 'addChild');
			
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Child Accounts</td>';
					'<td bgcolor="white" align="center">';
					'&nbsp;';
					(dCoreModTag_core_userAccounts->childAccTotal: (#dCoreUserRecord->get:3->get:1->get:1));
					'/';
					(#dCoreUserRecord->get:3->get:1->get:13);
					
					
					'</td>';
					
				'</tr>';
			else;	
				
				local:'parentUser' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'=(#dCoreUserRecord->get:3->get:1->get:2)))),(array:'id','user_firstname','user_lastname','usergroup_id')));
		
				'<tr valign="top">';
					'<td bgcolor="white">&nbsp;&nbsp;<b>Parent Account</td>';
					'<td bgcolor="white" align="left">';
					'<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#parentUser->get:3->get:1->get:1)) + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#parentUser->get:3->get:1->get:4)) + '" class="body">' + (#parentUser->get:3->get:1->get:2) + ' ' + (#parentUser->get:3->get:1->get:3) + '</a>';
					'<input type="hidden" name="master" value="'  + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#parentUser->get:3->get:1->get:1)) + '"';
					'</td>';
					
				'</tr>';
			/if;
			
			
			
			'</table>';
			
			dCoreModTag_hd241Grey:'Last Login',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="241">';
			
			
			'<tr valign="top">';
				'<td colspan=2 bgcolor="white" align="center">';
					local:'lastLoginLocal' = (dCoreModTag_core_userAccounts->lastLogin: #dCoreUserRecord->get:3->get:1->get:1);
					if: #lastLoginLocal->size > 0;
						var:'m' =(((Date:(#lastLoginLocal),-dateformat='%q'))->(Difference:((Date:(dCoreAPI_dateTags->timestamp),-dateformat='%q')), -minute));
						// calc for date dif.
						var:'h' = ($m / 60);
						loop: $h;
						 $m = ($m - 60);
						/loop;
						var:'d' = ($h / 24);
						loop: $d;
						  $h = ($h-24);
						/loop;
						$d; ' <b>Days</b>&nbsp;';
						$h; ' <b>Hrs</b>&nbsp;';
						$m; ' <b>Mins</b>&nbsp;';
					else;
						'Never Logged In';
					/if;
				'</td>';
				
			'</tr>';
			'</table>';
			
	'</td>';
	'</tr>';
	
	'<tr>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Account Permissions',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="241">';
			
			'<tr valign="top">';
				'<td bgcolor="white" width="110">&nbsp;&nbsp;<b>Read</td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecordPerms->get:3->get:1->get:3));
				'</td>';
			
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Write</td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecordPerms->get:3->get:1->get:4));
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Edit</td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecordPerms->get:3->get:1->get:5));
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Delete</td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecordPerms->get:3->get:1->get:6));
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Upload</td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecordPerms->get:3->get:1->get:7));
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Moderator</td>';
				'<td bgcolor="white" align="center">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecordPerms->get:3->get:1->get:8));
				'</td>';
				
			'</tr>';
			
			'</table>';
			
			
			

	'</td>';
	'</tr>';
	
	'</table>';
	
	
	
	
'</td>';
	'</tr>';
	'</table>';
	
	if: ((#dCoreUserRecord->get:3->get:1->get:12) == 'Parent');
	'<table><tr valign="top">';
		'<td valign="top" colspan="2">';
			dCoreModTag_hd746Grey:'Child Accounts',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="746">';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Name</b></td>';
				'<td bgcolor="white" align="center">&nbsp;&nbsp;<b>Telephone</b></td>';
				'<td bgcolor="white" align="center">&nbsp;&nbsp;<b>Last Log-in</b></td>';
			'</tr>';
		
			local:'getUsers' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'user_master'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$uanum)))),(array:'id','user_firstname','user_lastname','user_telephone','user_dt_modified','user_approved','user_dt_lastLogin','user_accType','user_accMax')));
			if: #getUsers->get:2 > 0;
				iterate: (#getUsers->get:3), (local:'getUsersListing');
					'<tr>';
						local:'dCoreUserRecordPerms' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array:(pair:'='=(pair:'user_id'=(#getUsersListing->get:1)))),(array:'userPermission_moderator')))->get:3->get:1->get:1;				
						'<td bgcolor="white">&nbsp;&nbsp;' + (dCoreAPI_switchOnOff->tickCross:(#getUsersListing->get:6)) + '&nbsp;&nbsp;<img src="dCoreIMG_core/icon_user.gif" border="0">&nbsp;&nbsp;<b><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#getUsersListing->get:1))+ '&ugnum='+ $ugnum +'" class="body">' + (#getUsersListing->get:3) + '</a></b>, ' + (#getUsersListing->get:2) + '</td>';
						'<td bgcolor="white" align="center">&nbsp;&nbsp;' + (#getUsersListing->get:4) + '</td>';
						'<td bgcolor="white" align="center">&nbsp;&nbsp;';
						if: #getUsersListing->get:7 != '';
							var:'m' =(((Date:(#getUsersListing->get:7),-dateformat='%q'))->(Difference:((Date:(dCoreAPI_dateTags->timestamp),-dateformat='%q')), -minute));
							// calc for date dif.
							var:'h' = ($m / 60);
							loop: $h;
							 $m = ($m - 60);
							/loop;
							var:'d' = ($h / 24);
							loop: $d;
							  $h = ($h-24);
							/loop;
							$d; ' <B>Days</b> ';
							$h; ' <b>Hrs</b> ';
							$m; ' <b>Mins</b>';
						else;
							'Never Logged In';
						/if;
						
						'</td>';
					'</tr>';
					#dCoreUserRecordPerms = (array);
				/iterate;	
			/if;	
			'</table>';
		'</td>';
	'</tr></table>';
/if;
?>

