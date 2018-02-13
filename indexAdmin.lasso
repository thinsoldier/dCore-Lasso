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

	// convert all (action_params) to variables
	
	Search_Arguments;
		var:(Search_FieldItem) = (Search_ValueItem);
	/Search_Arguments;
	
	// set the default usergroup to public mode '_0' indicates public
	var:'sess_userGroup' = '_0';
	
	/* 
	Include the configuration file AFTER  the search_args 
	statement to ensure anything placed in there can't be 
	overwritten and would create a security risk.
	*/
	include:(lassoapp_link:'conf_libs_config_lib.lasso');
	
	

	if: dCoreModTag_security->tcpRead:(client_ip)->(find: $sess_usergroup)->size == 0;
					
	
		var:'adminColor' = '#999999';
	
		if: ((dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_userGroups->setFields)->second))->get:2 == 0);

			if: (action_param:'pg') == 'install1';
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall_one.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				
			else: (action_param:'pg') == 'install2';
		
		
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall_two.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				
		
			else: (action_param:'pg') == 'install3';
				
				
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall_three.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
		
	
			else: (action_param:'pg') == 'install4';
				
				
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall_four.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				
		
			else: (action_param:'pg') == 'install5';
				
				
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall_five.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
			
			else: (action_param:'pg') == 'installf';
				
				
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall_final.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				
			else;	
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				
			/if;
	
			$adminTemplate;
	
		else: ((dCoreAPI_appTmpl: 'master')->size == 0);
		
			var:'adminPageTitle'	= 'Installation';
			var:'adminPage' = include: (lassoapp_link:'adm_coreInstall_final.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
			$adminTemplate;

		else;
		
			/* 
			Include the sessions file AFTER  the search_args 
			statement to ensure anything placed in there can't be 
			overwritten and would create a security risk.
			*/
			include:(lassoapp_link:'conf_libs_sessions_lib.lasso');
	
			// index page for holding the admin pages
	
			// overwrite the permissions
	
			var: 'readvar' = (action_param: 'read', -encodenone);
			var: 'read' = (string_replace: -find='\r', -replace=',',$readvar);
			
			var: 'writevar' = (action_param: 'write', -encodenone);
			var: 'write' = (string_replace: -find='\r', -replace=',',$writevar);
			
			var: 'editvar' = (action_param: 'edit', -encodenone);
			var: 'edit' = (string_replace: -find='\r', -replace=',',$editvar);
			
			var: 'deletevar' = (action_param: 'delete', -encodenone);
			var: 'delete' = (string_replace: -find='\r', -replace=',',$deletevar);
			
			var: 'uploadvar' = (action_param: 'upload', -encodenone);
			var: 'upload' = (string_replace: -find='\r', -replace=',',$uploadvar);
			
			var: 'moderatorvar' = (action_param: 'moderator', -encodenone);
			var: 'moderator' = (string_replace: -find='\r', -replace=',',$moderatorvar);
			
			var: 'accessvar' = (action_param: 'access', -encodenone);
			var: 'access' = (string_replace: -find='\r', -replace=',',$accessvar);

	
			var:'pg' = (var:'pg');
	
	
			var: 'pg' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'pg'));
				
				
			// admin areas
			
			if: (var:'sess_approved') == '1';
				
				include: (lassoapp_link:'indexSFS.lasso');
				
			else;
				var:'adminArea'	= 'Public';
				var:'adminPageTitle'	= 'Welcome';
				var:'adminPage' = include: (lassoapp_link:'adm_auth.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				
			/if;
	
	
			if: $adminArea == 'User';
				$adminColor = '#006699';
			else: $adminArea == 'Content';
				$adminColor = '#008080';
			else: $adminArea == 'File';
				$adminColor = '#FF9900';
			else: $adminArea == 'Homepage';
				$adminColor = '#993333';
			else: $adminArea == 'Statistic';
				$adminColor = '#CC6699';
			else;
				$adminColor = '#999999';
			/if;
	

			$adminTemplate;
	

	
		/if;

		
		/*
		
			log: -window;
			
			'\n\nUser Online:\n\n';
			'Start Time: ' + (var:'sess_starttime') + '\n';
			'Time Now: ' + (dCoreAPI_dateTags->timestamp) + '\n';
			'Session: ' + (session_id: -name=(dCoreModTag_core_appinfo->getSession:'1')) + '\n';
			'IP Address: ' + (client_ip) + '\n';
			'Name: ' + (var:'sess_firstname') + ' ' + (var:'sess_lastname') + '\n';
			'UserGroup: ' + (var:'sess_userGroup') + '\n';
			'Area: ' + (var:'adminArea') + '\n';
			
			
			/log;
		
		*/

	else;
	
		'<b>Your IP Address is blocked.</b>';
	
	/if;
	
?>