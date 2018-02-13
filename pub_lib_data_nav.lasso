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
inline: -database=(dCoreModTag_coreConfig->database), -username=(dCoreModTag_coreConfig->username), -password=(dCoreModTag_coreConfig->password);


// outputs the data for navigation

	var:'dCoreModAPI_Tmpl_output_sectTitle' 	= 	(array);
	var:'dCoreModAPI_Tmpl_output_catTitle' 		= 	(array);
	local:'dCoreSections' 				= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'>'=(pair:'section_id'='0'))),(array:'section_id','userPermission_read')))->get:3;
	
	if: $sess_accType == 'Child';
			local:'dCoreSectionsSort' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'<>'=(pair:'section_child'='1')),(pair:'='=(pair:'section_approved'='1'))),(array:'id'),(pair:'section_menu_position'='ASC')));
			
	else;
			local:'dCoreSectionsSort' 	=	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'section_approved'='1'))),(array:'id'),(pair:'section_menu_position'='ASC')));
		
	/if;
	
	// this converts the permissions through to the correct sort order.
	
	local:'dCoreArray' = (array);
	iterate: #dCoreSectionsSort->get:3, local:'dCoreSectionSortItem';
		iterate: #dCoreSections, local: 'dCoreSectionsItem';
			if: (#dCoreSectionsItem->get:1) == (#dCoreSectionSortItem->get:1);
				#dCoreSectionSortItem->insert: (#dCoreSectionsItem->get:2);
				#dCoreArray->insert:#dCoreSectionSortItem;
			/if;
		/iterate;
	/iterate;
	#dCoreSections = #dCoreArray;
	
	var:'dCoreModAPI_homepage_securityCheck' = (array);
			
	iterate: #dCoreSections, local:'authSecCheck';
		if: ($sess_userGroup == '_0');
		
		     $sess_read = '1';
		
		/if;
	
		if: ((#authSecCheck->get:2->split:',')->find: $sess_userGroup->size > 0)  && ($sess_read == '1');
			
			
			
			
			
			$dCoreModAPI_Tmpl_output_sectTitle->insert:(pair:(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#authSecCheck->get:1))=(dCoreModTag_core_sections->getTitle:(#authSecCheck->get:1)));
			$dCoreModAPI_homepage_securityCheck->insert:(#authSecCheck->get:1);
			
			if: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectNum')) == (#authSecCheck->get:1);
				
				if: $sess_accType == 'Child';
				
					local:'dCoreCategories' 				= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'<>'=(pair:'category_child'='1')),(pair:'='=(pair:'section_id'=(#authSecCheck->get:1))),(pair:'='=(pair:'category_approved'='1'))),(array:'id','category_name'),(pair:'category_menu_position'='ASC')))->get:3;
				
				else;
								
					local:'dCoreCategories' 				= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'section_id'=(#authSecCheck->get:1))),(pair:'='=(pair:'category_approved'='1'))),(array:'id','category_name'),(pair:'category_menu_position'='ASC')))->get:3;
				/if;
				
				
				iterate: #dCoreCategories, local:'authCatCheck';
				
					local:'dCoreCategoriesPerms' 			= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'category_id'=#authCatCheck->get:1))),(array:'category_id','userPermission_read')))->get:3;
					
					if: (#dCoreCategoriesPerms->get:1->get:2->split:',')->find: $sess_userGroup->size > 0;
						
					
							if: ((dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'category_id'=#dCoreCategories->get:1->get:1))),(array:'userPermission_read')))->get:3->get:1->get:1->split:','->find:$sess_userGroup->size > 0);
								
								
									$dCoreModAPI_Tmpl_output_catTitle->insert:(pair:(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#authCatCheck->get:1))=(dCoreModTag_core_categories->getTitle:(#authCatCheck->get:1)));
								
							/if;
					/if;
					
				/iterate;
			/if;
		/if;
	/iterate;
	
	
	local:'dCoreSectionPerm' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'section_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectNum'))))),(array:'userPermission_write','userPermission_edit','userPermission_delete','userPermission_upload','userPermission_moderator')))->get:3;
	local:'dCoreCategoryPerm' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'section_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectNum'))))),(array:'userPermission_write','userPermission_edit','userPermission_delete','userPermission_upload','userPermission_moderator')))->get:3;
	
	
	local:'dCorePermissionsWrite' = (#dCoreSectionPerm->get:1->get:1->split:',');
	
	local:'dCorePermissionsEdit' = (#dCoreSectionPerm->get:1->get:2->split:',');
	
	local:'dCorePermissionsDelete' = (#dCoreSectionPerm->get:1->get:3->split:',');
	
	local:'dCorePermissionsUpload' = (#dCoreSectionPerm->get:1->get:4->split:',');
	
	local:'dCorePermissionsModerator' = (#dCoreSectionPerm->get:1->get:5->split:',');
	
	
/inline;	
	
?>

