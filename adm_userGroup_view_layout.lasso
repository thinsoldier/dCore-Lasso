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





var:'doAnd' = '';
if: (var_defined:'max') == false;
	var:'max' = 10;

/if;




local:'dCoreUserAccount' = (array);
local:'dCoreUserAccountRecord' = (array);
if: (integer:(var:'skip')) == 0;
	$skip = 0;
else;
	$skip = (integer:(var:'skip'));
/if;

local:'otype' = '';
local:'htype' = ((var:'htype') + ' ');
local:'atype' = '';
local:'bwtype' = '';
local:'ewtype' = '';
local:'foundCount' = 0;


	if: (var:'stype') == 'eq';
		#otype = ' = ';
		
	else: (var:'stype') == 'any';
		#otype = ' LIKE ';
		
	else: (var:'stype') == 'bw';
		#otype = ' LIKE ';
		#bwtype = '%';
		
		
	else: (var:'stype') == 'ew';
		#otype = ' LIKE ';
		#ewtype = '%';
	/if;

	local:'sqlStatement' 		= 'Select id, user_firstname, user_lastname, user_telephone, user_dt_modified, user_approved, user_dt_lastLogin, user_accType, user_accMax from ' + (dCoreModTag_coreConfig->database) + '.dcoremoddb_core_users where user_accType = "parent" AND usergroup_id = "' + (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $ugnum) + '"';
	local:'sqlCountStatement' 	= 'Select  count(*) as totalCount from ' + (dCoreModTag_coreConfig->database) + '.dcoremoddb_core_users where user_accType = "parent" AND usergroup_id = "' + (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $ugnum) + '"';
	
	if: (var:'accNo') != '';
		#sqlStatement 		+= 	' AND';
		#sqlStatement 		+= 	'user_AccNo' + #otype + '"' + (#ewtype) + (var:'accNo') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_AccNo' + #otype + '"' + (#ewtype) + (var:'accNo') + (#bwtype) + '" ';
		if: ((var:'firstname') != '') || ((var:'lastname') != '') || ((var:'telephone') != '');
			#sqlStatement 		+= 	#htype;
			#sqlCountStatement 	+=  	#htype;
		/if;
	/if;
	if: (var:'firstname') != '';
		#sqlStatement 		+= 	' AND';
		#sqlCountStatement	+= 	' AND';
		#sqlStatement 		+= 	'user_firstname' + #otype + '"' + (#ewtype) +  (var:'firstname') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_firstname' + #otype + '"' + (#ewtype) +  (var:'firstname') + (#bwtype) + '" ';
		if: ((var:'lastname') != '') || ((var:'telephone') != '');
			#sqlStatement 		+= 	#htype;
			#sqlCountStatement 	+=  	#htype;
		/if;
	/if;
	if: (var:'lastname') != '';
	
		#sqlStatement 		+= 	' AND';
		#sqlCountStatement	+= 	' AND';
		#sqlStatement 		+= 	'user_lastname' + #otype + '"' + (#ewtype) +  (var:'lastname') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_lastname' + #otype + '"' + (#ewtype) +  (var:'lastname') + (#bwtype) + '" ';
		if:  ((var:'telephone') != '');
			#sqlStatement 		+= 	#htype;
			#sqlCountStatement 	+=  	#htype;
		/if;
	/if;
	if: (var:'telephone') != '';
		#sqlStatement 		+= 	' AND';
		#sqlCountStatement	+= 	' AND';
		#sqlStatement 		+= 	'user_telephone' + #otype + '"' + (#ewtype) +  (var:'telephone') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_telephone' + #otype + '"' + (#ewtype) +  (var:'telephone') + (#bwtype) + '" ';
		
	/if;
	
	if: (var:'sort') != '';
		#sqlStatement += ' ORDER BY ';
		if: (var:'sort') == 'accNo';#sqlStatement += ' user_AccNo ';/if;
		if: (var:'sort') == 'name';#sqlStatement += ' user_lastname ';/if;
		if: (var:'sort') == 'tel';#sqlStatement += ' user_telephone ';/if;
		if: (var:'sort') == 'userGroup';#sqlStatement += ' userGroup_id ';/if;
		if: (var:'sort') == 'emailA';#sqlStatement += ' user_emailaddress ';/if;
	
	/if;
	
	#sqlStatement += ' LIMIT ' + $skip + ', ' + (integer:(var:'max'));
	#sqlStatement 		+= 	';';
	#sqlCountStatement 	+=	';';
	
	inline: -database=(dCoreModTag_coreConfig->database),
	-Username=dCoreModTag_coreConfig->username, 
	-Password=dCoreModTag_coreConfig->password,
	-sql=#sqlStatement;
	
	#dCoreUserAccount->insert: (error_currenterror:-errorcode);
	
	rows;
		#dCoreUserAccountRecord->insert: (array: (field:'id'), (field:'user_firstname'), (field:'user_lastname'), (field:'user_telephone'), (field:'user_dt_modified'), (field:'user_approved'), (field:'user_dt_lastLogin'), (field:'user_accType'), (field:'user_accMax'));
	/rows;
	#dCoreUserAccount->insert:(#dCoreUserAccountRecord->size);
	/inline;
	#dCoreUserAccount->insert:#dCoreUserAccountRecord;
	inline: -database=(dCoreModTag_coreConfig->database),
		-Username=dCoreModTag_coreConfig->username, 
		-Password=dCoreModTag_coreConfig->password,
		-sql=#sqlCountStatement;
		
		local:'foundCount' = (field:'totalCount');
		local:'shownFirst' = (integer:(var:'skip')) + 1;
		local:'skipN' = (var:'skip');
		if: (#foundCount) > (integer:(var:'skip')) + (integer:(var:'max'));
			local:'shownLast'  = (integer:(var:'skip')) + (integer:(var:'max'));
		else;
			local:'shownLast'  = (#foundCount);
		/if;
		
		if: #shownlast == 0;
		#shownFirst = 0;
		/if;
		
	/inline;
	












'<table border="0" width="746" cellpadding="2" cellspacing="0">';
	'<tr valign="top">';
	'<td valign="top" width="746" rowspan="10">';
	
	
	
	
	
	
	
	
	'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2" rowspan="2">';
	dCoreModTag_hd746Blue:'User Group: ' + (#dCoreFoundSet->get:3->get:1->get:2),-encodenone;
		
		dCoreModTag_hd746Grey:'<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td><font color="white">Results: Showing </font><b><font color="white">' + #shownFirst + '</font></b><font color="white"> to </font><b><font color="white">' + (var:'shownlast') + '</font></b><font color="white"> of </font><b><font color="white">' + #foundCount + '</font></b><font color="white"> found.</font></td><td valign="top" align="right">&nbsp;</td></tr></table>',-encodenone;
		
		if: #dCoreUserAccount->get:2 > 0;
		
			'<table border="0" width="746" cellpadding="2" cellspacing="0" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff">';
				if: #shownLast > (integer:(var:'max'));
					'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug')+ '&ugnum=' + $ugnum + '&skip=' + ((integer:(var:'skip')) - (integer:(var:'max'))) + '&accNo=' + (var:'accNo') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body><< Prev</a>';
				else;
					'<font color=#cccccc><< Prev</font>';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" align="right">';
				if: (#skip < (#foundCount)) && ((#foundCount) > (integer:(var:'max'))) && ((#shownLast) != (#foundCount));
				'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug')+ '&ugnum=' + $ugnum + '&skip=' + ((integer:(var:'skip')) + (integer:(var:'max'))) + '&accNo=' + (var:'accNo') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body>Next >></a>';
				else;
					'<font color=#cccccc>Next >></font>';
				/if;
				'</td>';
				'</tr>';
			'</table>';
			
			
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff" align="center"><a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug')+ '&ugnum=' + $ugnum + '&skip=' + (var:'skipN') + '&accNo=' + (var:'accNo') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&max=' + (var:'max') + '&sort=name" class=body><b><font color=black>Name</font></b></a>';'</td>';
				'<td bgcolor="white" align="center">&nbsp;&nbsp;<b>Moderator</b></td>';
				'<td bgcolor="white" align="center">&nbsp;&nbsp;<b>Account Type</b></td>';
				'<td bgcolor="white" align="center">&nbsp;&nbsp;<b>Telephone</b></td>';
				'<td bgcolor="white" align="center">&nbsp;&nbsp;<b>Last Log-in</b></td>';
				'</tr>';
			
			
			iterate: #dCoreUserAccount->get:3, local:'dCoreUserAccountRecord';
			
				'<tr>';
					local:'dCoreUserRecordPerms' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array:(pair:'='=(pair:'user_id'=(#dCoreUserAccountRecord->get:1)))),(array:'userPermission_moderator')))->get:3->get:1->get:1;				
					'<td bgcolor="white">&nbsp;&nbsp;' + (dCoreAPI_switchOnOff->tickCross:(#dCoreUserAccountRecord->get:6)) + '&nbsp;&nbsp;<img src="dCoreIMG_core/icon_user.gif" border="0">&nbsp;&nbsp;<b><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#dCoreUserAccountRecord->get:1))+ '&ugnum='+ $ugnum +'" class="body">' + (#dCoreUserAccountRecord->get:3) + '</a></b>, ' + (#dCoreUserAccountRecord->get:2) + '</td>';
					'<td bgcolor="white" align="center">&nbsp;&nbsp;' + (dCoreAPI_switchOnOff->tickCross:(#dCoreUserRecordPerms)) + '</td>';
					'<td bgcolor="white" align="center">&nbsp;&nbsp;' + (#dCoreUserAccountRecord->get:8) + ' (' + (dCoreModTag_core_userAccounts->childAccTotal: (#dCoreUserAccountRecord->get:1)) + '/' ;
					if: (#dCoreUserAccountRecord->get:9) == '';
					 '0';
					else;
					 (#dCoreUserAccountRecord->get:9);
					/if;
					')</td>';
					'<td bgcolor="white" align="center">&nbsp;&nbsp;' + (#dCoreUserAccountRecord->get:4) + '</td>';
					'<td bgcolor="white" align="center">&nbsp;&nbsp;';
					if: #dCoreUserAccountRecord->get:7 != '';
						var:'m' =(((Date:(#dCoreUserAccountRecord->get:7),-dateformat='%q'))->(Difference:((Date:(dCoreAPI_dateTags->timestamp),-dateformat='%q')), -minute));
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
			/iterate;
			'</table>';
			
			
			'<table border="0" width="746" cellpadding="2" cellspacing="0" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff">';
				if: #shownLast > (integer:(var:'max'));
					'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug')+ '&ugnum=' + $ugnum + '&skip=' + ((integer:(var:'skip')) - (integer:(var:'max'))) + '&accNo=' + (var:'accNo') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body><< Prev</a>';
				else;
					'<font color=#cccccc><< Prev</font>';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" align="right">';
				if: (#skip < (#foundCount)) && ((#foundCount) > (integer:(var:'max'))) && ((#shownLast) != (#foundCount));
				'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug')+ '&ugnum=' + $ugnum + '&skip=' + ((integer:(var:'skip')) + (integer:(var:'max'))) + '&accNo=' + (var:'accNo') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body>Next >></a>';
				else;
					'<font color=#cccccc>Next >></font>';
				/if;
				'</td>';
				'</tr>';
			'</table>';
			
			
			
			
			
			
		/if;
			
	'</td>';
	
	'</tr>';
			
'</table>';

	'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Tasks',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acu') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSet->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_add.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acu') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSet->get:3->get:1->get:1)+'" class="body">Add User</a></td>';
			if: ($sess_userGroup == '1');
				'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aeug') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSet->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aeug') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSet->get:3->get:1->get:1)+'" class="body">Edit Gr.</a></td>';
				'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adug') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSet->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_delete.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adug') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSet->get:3->get:1->get:1)+'" class="body">Del Gr.</a></td>';
			/if;
			
		'</tr>';
		'</table>';
		
	'</td>';
	
	'</tr>';
	'<tr>';
	
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'User Group Status',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="30">';
			dCoreAPI_switchOnOff->tickCross: (#dCoreFoundSet->get:3->get:1->get:3);
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
				'<td bgcolor="white">&nbsp;&nbsp;<b>Create Account:</b></td>';
				'<td bgcolor="white" align="center">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSet->get:3->get:1->get:7);
				'</td>';
			
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Account Approval:</b></td>';
				'<td bgcolor="white" align="center">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSet->get:3->get:1->get:11);
				'</td>';
			
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Log-In:</b></td>';
				'<td bgcolor="white" align="center"width="30">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSet->get:3->get:1->get:8));
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>User Terms:</b></td>';
				'<td bgcolor="white" align="center"width="30">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSet->get:3->get:1->get:6));
				'</td>';
				
			'</tr>';
			'</table>';
	'</td>';
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Group Permissions',-encodenone;
			'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="241">';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Read</td>';
				'<td bgcolor="white" align="center">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetPerms->get:3->get:1->get:3);
				'</td>';
			
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Write</td>';
				'<td bgcolor="white" align="center">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetPerms->get:3->get:1->get:4);
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Edit</td>';
				'<td bgcolor="white" align="center">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetPerms->get:3->get:1->get:5);
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Delete</td>';
				'<td bgcolor="white" align="center" width="30">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetPerms->get:3->get:1->get:6);
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Upload</td>';
				'<td bgcolor="white" align="center">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetPerms->get:3->get:1->get:7);
				'</td>';
				
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Moderator</td>';
				'<td bgcolor="white" align="center">';
				dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetPerms->get:3->get:1->get:8);
				'</td>';
				
			'</tr>';
			'</table>';
	'</td>';
	'</tr>';
	
	/*
	'<tr valign="top">';
	
	'<form action="' +(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug')+ '&ugnum=' + $ugnum +' method="post">';
	'<td valign="top" width="241" rowspan="3">';
		dCoreModTag_hd241Grey:'Search ' + (#dCoreFoundSet->get:3->get:1->get:2),-encodenone;
		'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="241">';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>First Name:</b></td>';
				'<td bgcolor="white"><input type="text"></td>';
			'</tr>';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Last Name:</b></td>';
				'<td bgcolor="white"><input type="text"></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Telephone</b></td>';
				'<td bgcolor="white"><input type="text"></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white" colspan="2">';
				'&nbsp;&nbsp;&nbsp;';
				'<select name="rules">';
				'<option value="and">Exact Match';
				'<option value="or">Any Match';
				'</select>';
				'&nbsp;<input type="submit" value="Search"></td>';
			'</tr>';
						
		'</table>';
	'</td>';
	'</form>';
	'</tr>';
	*/
'</table>';
?>

