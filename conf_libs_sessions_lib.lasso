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




//this is the sessions libarary that will log all visitors and allow authentication
var:'sess_read' 	= '1';
var:'sess_write' 	= '0';
var:'sess_edit' 	= '0';
var:'sess_delete' 	= '0';
var:'sess_upload'	= '0';
var:'sess_moderator' 	= '0';

var:'sess_accNo' 	= '';
var:'sess_accType' 	= '';
var:'sess_accMax' 	= '0';

var:'sess_userid' 	= '';
var:'sess_keyid' 	= '';
var:'sess_usertype' 	= '';
var:'sess_firstname'	= '';
var:'sess_lastname' 	= '';

var:'sess_approved' 	= '';
var:'sess_emailaddress'	= '';
var:'sess_city' 	= '';
var:'sess_country'	= '';
var:'sess_clientIP'	= '';
							
if: ((Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'pg')) == 'logout') || ((Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'pg')) == 'Plogout');
				Session_End: -Name=(dCoreModTag_core_appinfo->getSession:'1');
				var:'dCoreModAPI_Tmpl_output_getTitle' 		= '';
				var:'dCoreModAPI_Tmpl_output_getText' 		= '<table border="0" width="100%" class="' + (dCoreModTag_tmplClass->sectionTitle) +'" cellpadding="0" cellspacing="0"><tr class="' + (dCoreModTag_tmplClass->sectionTitle) +'"><td colspan="2" class="' + (dCoreModTag_tmplClass->sectionTitle) +'"><b class="' + (dCoreModTag_tmplClass->sectionTitle) +'">Logged Out</b></td></tr></table><p class="' + (dCoreModTag_tmplClass->contentText) +'">You have been logged out of your session successfully.</p>';
				
/if;

	Session_Start: 	-Name=(dCoreModTag_core_appinfo->getSession:'1'),  
			-Expires=(integer:(dCoreModTag_core_appinfo->getSessionTime:'1')),
			-uselink;
										
if: ((var_defined: 'sess_alive') == false) || ((local:'updateSessionState') == '1') || ((var: 'sess_clientIP') != (client_IP));
		
		local:'dCoreUserRecord'	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:(dCoreModTag_core_appinfo->getUsernameField:'1')=(var:'un'))),(pair:'='=(pair:('user_password')=(var:'pw')))),(dCoreModTag_core_userAccounts->setFields)->second));
		
		
			if: (#dCoreUserRecord->get:2) == 1;
					
						
				if: 	($un != '') && ($pw != '');
					if: ((#dCoreUserRecord->get:3->get:1->get:15) == '1') && ((#dCoreUserRecord->get:3->get:1->get:27) == '1');
				
						if: 	(
								((#dCoreUserRecord->get:3->get:1->get:12) != 'Parent') 
									&& 
								((dCoreModTag_core_userAccounts->userApproved:(dCoreModTag_core_userAccounts->parentAcc: (#dCoreUserRecord->get:3->get:1->get:1)->(get:1)) == '1') 
							)
							|| 
							(#dCoreUserRecord->get:3->get:1->get:12) == 'Parent');
			
			
								Variable: 'sess_startTime' 	= (dCoreAPI_dateTags->timestamp);
								Variable: 'sess_clientIP' 	= (client_ip);
		
								Variable: 'sess_userid' 	= (#dCoreUserRecord->get:3->get:1->get:1);
								Variable: 'sess_keyid' 		= (#dCoreUserRecord->get:3->get:1->get:1);
								Variable: 'sess_usertype'	= (#dCoreUserRecord->get:3->get:1->get:3);
								Variable: 'sess_firstname'	= (#dCoreUserRecord->get:3->get:1->get:4);
								Variable: 'sess_lastname'	= (#dCoreUserRecord->get:3->get:1->get:5);
								Variable: 'sess_approved'	= (#dCoreUserRecord->get:3->get:1->get:27);
								Variable: 'sess_emailaddress'	= (#dCoreUserRecord->get:3->get:1->get:8);
								
								Variable: 'sess_accNo' 		= (#dCoreUserRecord->get:3->get:1->get:11);
								Variable: 'sess_accType'	= (#dCoreUserRecord->get:3->get:1->get:12);
								Variable: 'sess_accMax'		= (#dCoreUserRecord->get:3->get:1->get:13);
									
								Variable: 'sess_userGroup' 	= (#dCoreUserRecord->get:3->get:1->get:3);
								Variable: 'sess_street' 	= (#dCoreUserRecord->get:3->get:1->get:20);
								Variable: 'sess_city' 		= (#dCoreUserRecord->get:3->get:1->get:21);
								Variable: 'sess_country' 	= (#dCoreUserRecord->get:3->get:1->get:24);
								Variable: 'sess_state' 		= (#dCoreUserRecord->get:3->get:1->get:22);
								Variable: 'sess_zip' 		= (#dCoreUserRecord->get:3->get:1->get:23); 
								Variable: 'sess_telephone' 	= (#dCoreUserRecord->get:3->get:1->get:25);  
									
																		
								Variable: 'sess_company'	= (#dCoreUserRecord->get:3->get:1->get:29);
									
								local:'dCoreUserRecordPerms' 	= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array:(pair:'='=(pair:'user_id'=(#dCoreUserRecord->get:3->get:1->get:1)))),(dCoreModTag_core_usersPerms->setFields)->second));
										
								Variable: 'sess_read'		= (#dCoreUserRecordPerms->get:3->get:1->get:3);
								Variable: 'sess_write'		= (#dCoreUserRecordPerms->get:3->get:1->get:4);
								Variable: 'sess_edit'		= (#dCoreUserRecordPerms->get:3->get:1->get:5);
								Variable: 'sess_delete'		= (#dCoreUserRecordPerms->get:3->get:1->get:6);
								Variable: 'sess_upload'		= (#dCoreUserRecordPerms->get:3->get:1->get:7);
								Variable: 'sess_moderator'	= (#dCoreUserRecordPerms->get:3->get:1->get:8);
								
								
								
								
								
								var:'sess_categoryModerator' = (array);
								var:'sess_sectionModerator' = (array);
								if: $sess_moderator == '1';
								
									inline: -database=(dCoreModTag_coreConfig->database),
									-Table='dCoreModdb_core_userPermissions',
									-Username=(dCoreModTag_coreConfig->username), 
									-Password=(dCoreModTag_coreConfig->password),
									-returnfield='section_id',
									-returnfield='category_id',
									-opbegin='or',
										-op='cn',
										'userPermission_moderator'=(','+$sess_userGroup),
										-op='cn',
										'userPermission_moderator'=($sess_userGroup+','),
										-op='eq',
										'userPermission_moderator'=($sess_userGroup),
									-opend='or',
									-maxrecords='all',
									-search;
										rows;
											$sess_sectionModerator->insert:(field:'section_id');
											$sess_categoryModerator->insert:(field:'category_id');
										/rows;
									/inline;
									
									
								/if;
												
							
								Variable: 'sess_alive'		= '1';
							
								local: 'updateLoginTime' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array:(pair:'user_dt_lastLogin'=dCoreAPI_dateTags->timestamp)),(array: (pair:'='=(pair:'id'=(#dCoreUserRecord->get:3->get:1->get:1))))));
	
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_startTime';
							
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_clientIP';
								
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_userid';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_keyid';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'un';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'pw';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_usertype';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_firstname';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_lastname';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_approved';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_emailaddress';
								
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_company';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_userGroup';
								
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_accNo';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_accType';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_accMax';
								
								
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_street';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_city';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_country';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_state';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_zip';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_telephone';
								
								
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_read';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_write';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_edit';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_delete';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_upload';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_moderator';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_categoryModerator';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_sectionModerator';
								
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_alive';
								var:'errorAccess' = (#dCoreUserRecord->get:3->get:1->get:15);
					
							else;
								var:'errorAccess' = 'Sorry, your parent account is not approved.';
								Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_startTime';
								var:'sess_usertype' = '_0';
								var:'sess_userid' = '0';
								var:'sess_alive' = '0';
							/if;
						
						else;
							var:'errorAccess' = 'Sorry, your not able to log-in with this account.';
							Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_startTime';
							var:'sess_usertype' = '_0';
							var:'sess_userid' = '0';
							var:'sess_alive' = '0';
						/if;
					
				else;
					Session_AddVariable: -Name=(dCoreModTag_core_appinfo->getSession:'1'), 'sess_startTime';
					var:'errorAccess' = 'Sorry, your username or password did not match those of the account.';
					var:'sess_usertype' = '_0';
					var:'sess_userid' = '0';
					var:'sess_alive' = '0';
				/if;
						
				
			else;
				var:'errorAccess' = 'Sorry, that account could not be found.';
				var:'sess_usertype' = '_0';
				var:'sess_userid' = '0';
				var:'sess_alive' = '0';
			/if;



/if;


	
?>

