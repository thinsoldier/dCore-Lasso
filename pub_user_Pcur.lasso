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

if: ((var:'un') != '') && ((var:'pw') != '') && ((var:'jform') != '1');




	if: (dCoreModTag_moduleDb->(count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'user_emailaddress'=(var:'un'))),(pair:'='=(pair:'user_password'=(var:'pw')))),(dcoremodtag_core_userAccounts->setFields)->second))->(get:2) > 0;
	
	
	
			if: $sess_usertype == '_0';
			
				var:'joinError' 	= '<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Please log-in below!</b></p>';
						var:'adminArea'		= 'Public';
						var:'adminPageTitle'	= 'Log-In';
						var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_auth.lasso');	
						dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
						abort;
			else;
				var:'joinError' 	= '<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Please log-in below!</b></p>';
						var:'adminArea'		= 'Public';
						var:'adminPageTitle'	= 'Log-In';
						var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_phome.lasso');	
						dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
						abort;
			
			
			
			
			/if;
	
	
	else;
	
			var:'joinError' = '<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Account Not Found!</b></p>';
			var:'uGroupTerms' = '1';
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Create Account';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_auth.lasso');
			dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
			abort;
	
	
	
	
	
	
	/if;



else: ((var:'jform') == '1');


	if: (dCoreModTag_moduleDb->(count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'user_emailaddress'=(var:'emailaddress')))),(dcoremodtag_core_userAccounts->setFields)->second))->get:2 == 0;
	
	
		if: (var:'emailaddress') >> '@';
				
			if:((var:'password_test') == (var:'password'));
			
				If:	((var:'firstname')=='') ||
					!((var:'emailaddress') >> '@') ||
					((var:'lastname')=='') ||
					((var:'emailaddress')=='') ||
					((var:'telephone')=='') ||
					((var:'password')=='');
					
					Var:'proceed'='false';
				/If;
			
			else: !((var:'emailaddress') >> '@');
			
				var:'joinError' = '<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Missing Information!</b></p>';
				var:'uGroupTerms' = '1';
				var:'adminArea'	= 'Public';
				var:'adminPageTitle'	= 'Create Account';
				var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Pcu.lasso');	
				dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
				abort;
			
			
			else;
			
				var:'joinError' = '<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Passwords do NOT match!</b></p>';
				var:'uGroupTerms' = '1';
				var:'adminArea'	= 'Public';
				var:'adminPageTitle'	= 'Create Account';
				var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Pcu.lasso');	
				dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
				abort;
			/If;
			
		else;
		
				var:'joinError' = '<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Missing Information!</b></p>';
				var:'uGroupTerms' = '1';
				var:'adminArea'	= 'Public';
				var:'adminPageTitle'	= 'Create Account';
				var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Pcu.lasso');	
				dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
				abort;
				
		/If;	
		
		If: (var: 'proceed') != 'false';
		
			var:'accType'		= 'Parent';
			var:'accMax'		= '0';
			var:'dt_created'	= dCoreAPI_dateTags->timestamp;
			var:'approved' 		= '1';
			var:'login'		= '1';
			
			
			var:'usergroup_id' 			= 	(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'ugroup'));
			
			
			local:'dCoreUserRecordPerms' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'userGroup_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugroup'))))),(dCoreModTag_core_userGroupsPerms->setFields->second)));
			
			var:'read' 	= 	#dCoreUserRecordPerms->get:3->get:1->get:3;
			var:'write' 	= 	#dCoreUserRecordPerms->get:3->get:1->get:4;
			var:'edit' 	= 	#dCoreUserRecordPerms->get:3->get:1->get:5;
			var:'delete' 	= 	#dCoreUserRecordPerms->get:3->get:1->get:6;
			var:'upload' 	= 	#dCoreUserRecordPerms->get:3->get:1->get:7;
			
			
			var:'email_host' 			= 	(var:'emailaddress')->split: '@'->get:2;
			var:'email_account' 			= 	(var:'emailaddress')->split: '@'->get:1;
			local: 'dCoreInsertFields' 		= 	dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(dCoreModTag_core_userAccounts->setLocal));
			
			if: (error_currenterror: -errocode) == 0;
		
				var:'user_id' = #dCoreInsertFields->get:2;
				
				local: 'dCoreInsertFieldsPerms'  = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_usersPerms->setLocal));
				if: ((dCoreModTag_coreConfig->supportMail) != '');
				Email_Send: 	-From=(dCoreModTag_coreConfig->supportMail),
						-To=(var:'emailaddress'),
			                        -Subject='Account Created',
			                        -Body='We can confirm that your account has been generated with the following email address assigned to it.\n\n' + $emailaddress + '\n\nIt was created by IP Address: ' + (client_ip);
			        /if;  	    		
			/if;
		
		
			local:'dCoreUserRecord' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'=$user_id))),(dCoreModTag_core_userAccounts->setFields)->second));
			local:'dCoreUserRecordPerms' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'user_id'=$user_id))),(dCoreModTag_core_usersPerms->setFields)->second));
			
			
			if: (((var:'sess_userGroup') == '_0') || ((var:'sess_userGroup') == ''));
				var:'uGroupTerms' = '1';
				
				if: (var_defined:'user_id') == TRUE;
					var:'joinError' 	= '<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Please log-in below!</b></p>';
					var:'adminArea'		= 'Public';
					var:'adminPageTitle'	= 'Log-In';
					var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_auth.lasso');	
					dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
					abort;
				else;
					var:'uGroupTerms' = '1';
					var:'adminArea'	= 'Public';
					var:'adminPageTitle'	= 'Create Account';
					var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Pcu.lasso');
					dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
					abort;
				/if;
			/if;
		
		else;
		
			if: (((var:'sess_userGroup') == '_0') || ((var:'sess_userGroup') == ''));
		
				if: ((var:'un') == '') || ((var:'pw') == '');
					var:'joinError' 	='<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Missing Information!</b></p>';
				
				
				else;
				
					var:'joinError' 	='<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Account Not Found!</b></p>';
				/if;
				
				if: (((var:'sess_userGroup') == '_0') || ((var:'sess_userGroup') == ''));
					
						
					var:'uGroupTerms' = '1';
					var:'adminArea'	= 'Public';
					var:'adminPageTitle'	= 'Create Account';
					var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Pcu.lasso');
					dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1');
					abort;
				/if;
			/if;
		/if;
	else;
	
		if: (((var:'sess_userGroup') == '_0') || ((var:'sess_userGroup') == ''));
			'<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Duplicate Account!</b></p>';
			var:'uGroupTerms' = '1';
			if: (var_defined:'user_id') == TRUE;
				include:(LassoApp_Link:'pub_auth.lasso');
			else;
				include:(LassoApp_Link:'pub_user_Pcu.lasso');
			/if;
		/if;
	
		
	/if;
	
	
else;
	
		'<P class="' + (dCoreModTag_tmplClass->content) + '"><b  class="' + (dCoreModTag_tmplClass->content) + '">Missing Information!</b></p>';
		var:'uGroupTerms' = '1';
		include:(LassoApp_Link:'pub_auth.lasso');
		

	
/if;
?>