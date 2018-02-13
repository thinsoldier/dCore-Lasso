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

		
	inline: -database=(dCoreModTag_coreConfig->database),
		-Username=(dCoreModTag_coreConfig->username), 
		-Password=(dCoreModTag_coreConfig->password),
		-sql='SELECT id FROM ' + (dCoreModTag_coreConfig->database) + '.dCoreModdb_core_appinfo;',
		-maxrecords=1;


		if: (found_count) == 0;		
	
			
			var:'dCoredbnametables' = (array);
			inline:  -username=(dCoreModTag_coreConfig->username), -password=(dCoreModTag_coreConfig->password);

				
				database_tableNames: (dCoreModTag_coreConfig->database);
				
					$dCoredbnametables->(insert:(database_tablenameItem));
				
				/database_tablenames;
					
			
			/inline;
			include: (lassoapp_link:'conf_libs_tables_lib.lasso');
			

		// tables to check for are:

			var: 'dCoretable_checkloop' = (Array:
					'dCoreModdb_core_appinfo',
					'dCoreModdb_core_sections',
					'dCoreModdb_core_categories',
					'dCoreModdb_core_security',
					'dCoreModdb_core_content',
					'dCoreModdb_core_contentHistory',
					'dCoreModdb_core_files',
					'dCoreModdb_core_links',
					'dCoreModdb_core_statistics',
					'dCoreModdb_core_modules',
					'dCoreModdb_core_templates',
					'dCoreModdb_core_errors',
					'dCoreModdb_core_userPermissions',
					'dCoreModdb_core_users',
					'dCoreModdb_core_fileCat',
					'dCoreModdb_core_userGroups',
					'dCoreModdb_core_homepage',
					'dCoreModdb_core_dropdowns');
					
			// check to see that the table exists, if it doesn't 
			// then create them and insert the default data.
			
			var:'dCoresql_tablequery' 	= '';
			var:'dCoresql_insertquery' 	= '';
	
			loop:$dCoretable_checkloop->size;
			
				if: ($dCoredbnametables->(find:($dCoretable_checkloop->(get:(loop_count)))))->size == 0;
			
					// create table & insert data
				
					$dCoresql_tablequery = 'dCoreSQLtable_' + ($dCoretable_checkloop->(get:(loop_count)));
					
					
					$dCoresql_insertquery = 'dCoreSQLinsert_' + ($dCoretable_checkloop->(get:(loop_count)));
					
					if: $dcoresql_tablequery != '';
					
						inline:  -database=(dCoreModTag_coreConfig->database),
						-username=(dCoreModTag_coreConfig->username), 
						-password=(dCoreModTag_coreConfig->password),
						-SQL=(var: $dcoresql_tablequery);
						
						
						/inline;
					
					/if;
				
					if: $dcoresql_insertquery != '';
					
						inline:  -database=(dCoreModTag_coreConfig->database),
						-username=(dCoreModTag_coreConfig->username), 
						-password=(dCoreModTag_coreConfig->password),
						-SQL=(var: $dcoresql_insertquery);
						
						
						/inline;
					
					/if;
					
					sleep: 20;
				
					inline:  -database=(dCoreModTag_coreConfig->database),
						-username=(dCoreModTag_coreConfig->username), 
						-password=(dCoreModTag_coreConfig->password),
						-SQL='OPTIMIZE TABLE ' + (dCoreModTag_coreConfig->database) + '.' + ($dcoretable_checkloop->(get:(loop_count)));
						
						
					/inline;
					
					sleep: 20;
				
				
					inline:  -database=(dCoreModTag_coreConfig->database),
						-username=(dCoreModTag_coreConfig->username), 
						-password=(dCoreModTag_coreConfig->password),
						-SQL='FLUSH TABLE ' + (dCoreModTag_coreConfig->database) + '.' + ($dcoretable_checkloop->(get:(loop_count)));
						
						
					/inline;
				
					inline:  -database=(dCoreModTag_coreConfig->database),
						-username=(dCoreModTag_coreConfig->username), 
						-password=(dCoreModTag_coreConfig->password),
						-keyfield='id',
						-sql='SELECT id FROM ' + (dCoreModTag_coreConfig->database) + '.' + ($dcoretable_checkloop->(get:(loop_count))) + ';',
						-maxrecords=1;
						
						
						
					/inline;
					var:'dcoresql_tablequery' = '';
					var:'dcoresql_insertquery' = '';
					var:'dcoresql_complete' = 1;
				/if;
			/loop;
	
	
	
			//var:'dcoresql_Deletequery' 	= '';
			var:'dcoresql_insertquery' 	= '';



			if: ((var:'dcorereset_db') == '1') && ((var:'dcorereset_db_auth') == (dCoreModTag_coreConfig->password));
		
				loop:$dcoretable_checkloop->size;
				
					//$dcoresql_Deletequery = ($dcoretable_checkloop->(get:(loop_count)));
					$dcoresql_insertquery = ($dcoretable_checkloop->(get:(loop_count))) + '_sql_insert';
								
			
					//if: $dCoresql_Deletequery != '';
					
						//inline:  -database=(dCoreModTag_coreConfig->database),
						//-username=(dCoreModTag_coreConfig->username), 
						//-password=(dCoreModTag_coreConfig->password),
						//-SQL='delete from '+ (var: dCoresql_Deletequery) + ';';
						
						///inline;
					
					///if;
					
					if: $dCoresql_insertquery != '';
					
						inline:  -database=(dCoreModTag_coreConfig->database),
						-username=(dCoreModTag_coreConfig->username), 
						-password=(dCoreModTag_coreConfig->password),
						-SQL=(var: $dcoresql_insertquery);
						
						/inline;
					
					/if;
					
					sleep: 20;
					
					//var:'dcoresql_Deletequery' = '';
					var:'dcoresql_insertquery' = '';
							
				/loop;
			/if;	
	
		/if;

	/inline;




	
?>