

<?lassoscript
/*#######################################################################
#									#
#		Application: 	dCore					#
#		Version: 	1.9.4					#
#		Author: 	Duncan Cameron				#
#									#
#		File:							#
#		File Purpose:						#
#		Area:		Admin/Moderator				#
#									#
#		Date: July 2004						#
#									#
#									#
#									#
#########################################################################
#									#
#	-----  DO *NOT* AMEND SOURCE BELOW  -----			#
#									#
#######################################################################*/






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

	local:'sqlStatement' 		= 'Select id, user_master, userGroup_id, user_firstname, user_lastname, user_emailaddress, user_accType, user_accType, user_telephone from ' + (dCoreModTag_coreConfig->database) + '.dcoremoddb_core_users where ';
	local:'sqlCountStatement' 	= 'Select  count(*) as totalCount from ' + (dCoreModTag_coreConfig->database) + '.dcoremoddb_core_users where ';
	
	if: (var:'accType') != '';
		#sqlStatement 		+= 	'user_accType' + #otype + '"' + (#ewtype) + (var:'accType') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_accType' + #otype + '"' + (#ewtype) + (var:'accType') + (#bwtype) + '" ';
		if: ((var:'firstname') != '') || ((var:'lastname') != '') || ((var:'telephone') != '');
			#sqlStatement 		+= 	#htype;
			#sqlCountStatement 	+=  	#htype;
		/if;
	/if;
	if: (var:'firstname') != '';
		#sqlStatement 		+= 	'user_firstname' + #otype + '"' + (#ewtype) +  (var:'firstname') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_firstname' + #otype + '"' + (#ewtype) +  (var:'firstname') + (#bwtype) + '" ';
		if: ((var:'lastname') != '') || ((var:'telephone') != '');
			#sqlStatement 		+= 	#htype;
			#sqlCountStatement 	+=  	#htype;
		/if;
	/if;
	if: (var:'lastname') != '';
	
		#sqlStatement 		+= 	'user_lastname' + #otype + '"' + (#ewtype) +  (var:'lastname') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_lastname' + #otype + '"' + (#ewtype) +  (var:'lastname') + (#bwtype) + '" ';
		if:  ((var:'telephone') != '');
			#sqlStatement 		+= 	#htype;
			#sqlCountStatement 	+=  	#htype;
		/if;
	/if;
	
	if: (var:'telephone') != '';
		#sqlStatement 		+= 	'user_telephone' + #otype + '"' + (#ewtype) +  (var:'telephone') + (#bwtype) + '" ';
		#sqlCountStatement 	+=	'user_telephone' + #otype + '"' + (#ewtype) +  (var:'telephone') + (#bwtype) + '" ';
		
	/if;
	if: ((var:'firstname') != '') || ((var:'lastname') != '') || ((var:'telephone') != '') || ((var:'accType') != '');
		#sqlStatement 		+= 	' AND ';
		#sqlCountStatement 	+= 	' AND ';
	/if;	
		
		#sqlStatement 		+= 	'userGroup_id = "' + (#ewtype) +  (var:'userGroup') + '" ';
		#sqlCountStatement 	+=	'userGroup_id = "' + (#ewtype) +  (var:'userGroup') + '" ';
		
	
	
	if: (var:'sort') != '';
		#sqlStatement += ' ORDER BY ';
		if: (var:'sort') == 'accType';#sqlStatement += ' user_accType ';/if;
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
	// #sqlStatement;
	
	// error_currenterror;
	#dCoreUserAccount->insert: (error_currenterror:-errorcode);
	
	rows;
		#dCoreUserAccountRecord->insert: (array: (field:'id'),(field:'user_accType'),(field:'user_firstname'),(field:'user_lastname'),(field:'user_telephone'),(field:'userGroup_id'),(field:'user_emailaddress'));
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
		
	/inline;
	
'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2" rowspan="2">';
		dCoreModTag_hd746Grey:'<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td><font color="white">Results: Showing </font><b><font color="white">' + #shownFirst + '</font></b><font color="white"> to </font><b><font color="white">' + (var:'shownlast') + '</font></b><font color="white"> of </font><b><font color="white">' + #foundCount + '</font></b><font color="white"> found.</font></td><td valign="top" align="right">&nbsp;</td></tr></table>',-encodenone;
		
		if: #dCoreUserAccount->get:2 > 0;
		
			'<table border="0" width="746" cellpadding="2" cellspacing="0" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff">';
				if: #shownLast > (integer:(var:'max'));
					'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + ((integer:(var:'skip')) - (integer:(var:'max'))) + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body><< Prev</a>';
				else;
					'<font color=#cccccc><< Prev</font>';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" align="right">';
				if: (#skip < (#foundCount)) && ((#foundCount) > (integer:(var:'max'))) && ((#shownLast) != (#foundCount));
				'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + ((integer:(var:'skip')) + (integer:(var:'max'))) + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body>Next >></a>';
				else;
					'<font color=#cccccc>Next >></font>';
				/if;
				'</td>';
				'</tr>';
			'</table>';
			
			
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff" align="center"><a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + (var:'skipN') + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (var:'max') + '&sort=name" class=body><b><font color=black>Full Name</font></b></a>';'</td>';
				'<td bgcolor="#ffffff" align="center"><a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + (var:'skipN') + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (var:'max') + '&sort=userGroup" class=body><b><font color=black>UserGroup</font></b></a>';'</td>';
				'<td bgcolor="#ffffff" align="center"><a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + (var:'skipN') + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (var:'max') + '&sort=emailA" class=body><b><font color=black>Email</font></b></a>';'</td>';
				'<td bgcolor="#ffffff" align="center"><a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + (var:'skipN') + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (var:'max') + '&sort=tel" class=body><b><font color=black>Telephone</font></b></a>';'</td>';
				'<td bgcolor="#ffffff"><a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + (var:'skipN') + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (var:'max') + '&sort=accType" class=body><b><font color=black>Account Type</font></b></a>';'</td>';
				'</tr>';
			
			
			iterate: #dCoreUserAccount->get:3, local:'dCoreUserAccountRecord';
			
				'<tr valign="top">';
				'<td bgcolor="#ffffff">&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserAccountRecord->get:1)+'&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserAccountRecord->get:6)+'" border=0><img src="dCoreIMG_core/icon_user.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserAccountRecord->get:1)+'&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserAccountRecord->get:6)+'" class="body"><b>' + (#dCoreUserAccountRecord->get:4) + '</b>, ' + (#dCoreUserAccountRecord->get:3) + '</a></td>';
				'<td bgcolor="#ffffff" align="left">&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (#dCoreUserAccountRecord->get:6))+'" class="body">' + dCoreModTag_core_userGroups->getTitle:(#dCoreUserAccountRecord->get:6)->get:1 + '</a></td>';
				'<td bgcolor="#ffffff" align="left">&nbsp;<img src="dCoreIMG_core/icon_email.gif" border="0">&nbsp;<a href="mailto:' + (#dCoreUserAccountRecord->get:7) + '" class="body">' + (#dCoreUserAccountRecord->get:7) + '</a></td>';
				'<td bgcolor="#ffffff" align="left">&nbsp;<img src="dCoreimg_core/icon_tel.gif" border="0">&nbsp;' + (#dCoreUserAccountRecord->get:5) + '</td>';
				'<td bgcolor="#ffffff">&nbsp;<img src="dCoreimg_core/icon_user.gif" border="0">&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avu') + '&uanum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserAccountRecord->get:1)+'&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreUserAccountRecord->get:6)+'" class="body"><b>' + (#dCoreUserAccountRecord->get:2) + '</a></td>';
				'</tr>';
			/iterate;
			'</table>';
			
			
			'<table border="0" width="746" cellpadding="2" cellspacing="0" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff">';
				if: #shownLast > (integer:(var:'max'));
					'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + ((integer:(var:'skip')) - (integer:(var:'max'))) + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body><< Prev</a>';
				else;
					'<font color=#cccccc><< Prev</font>';
				/if;
				'</td>';
				'<td bgcolor="#ffffff" align="right">';
				if: (#skip < (#foundCount)) && ((#foundCount) > (integer:(var:'max'))) && ((#shownLast) != (#foundCount));
				'<a href="' + (lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+ '&skip=' + ((integer:(var:'skip')) + (integer:(var:'max'))) + '&accType=' + (var:'accType') + '&telephone=' + (var:'telephone') + '&firstname=' + (var:'firstname') + '&lastname=' + (var:'lastname') + '&stype=' + (var:'stype') + '&userGroup=' + (var:'userGroup') + '&max=' + (integer:(var:'max')) + '&sort=' + (var:'sort') + '" class=body>Next >></a>';
				else;
					'<font color=#cccccc>Next >></font>';
				/if;
				'</td>';
				'</tr>';
			'</table>';
			
			
		/if;
			
	'</td>';
	
	'</tr>';
	'<tr valign="top">';
	
	'<form action="' +(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+'" method="post">';
	'<td valign="top" width="241">';
	include:(lassoapp_link:'adm_user_searchForm.lasso');
	'</td>';
	'</form>';
	'</tr>';		
'</table>';

	
?>

