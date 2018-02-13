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

/*
Check to see that the database exists if not show install
page (database error), if it is there but no configuration
record, show the installation page. Otherwise let the app
run with pulling content.
*/


if: ((dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_userGroups->setFields)->second))->get:2 == 0) || ((dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_appinfo->setFields)->second))->get:2 == 0);
				
			local:'dCore_dbactive' = 0;
	
			inline:  -Username=(dCoreModTag_coreConfig->username), -Password=(dCoreModTag_coreConfig->password);
			
				Database_Names;
				
					if: (Database_NameItem) == (dCoreModTag_coreConfig->database);
						
						local:'dCore_dbactive' = 1;
						
					else: (Database_NameItem) != 'Contacts';
					
						local:'enabledDB' = (Database_NameItem);
						
					/if;
					
				/Database_Names;
				
				
			/inline;
	
			if: #dCore_dbactive == 0;
			
			
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				$adminTemplate;abort;
				
			
			else;
					
				include: (lassoapp_link:'insertTables.lasso');
				
				var:'adminArea'	= 'Installation';
				var:'adminPageTitle'	= 'Installation';
				var:'adminPage' = include: (lassoapp_link:'adm_coreInstall.lasso');
				var:'adminTemplate' = include: (lassoapp_link:'adm_template_public.lasso');
				$adminTemplate;abort;
			
			/if;
			
		/if;
		
?>