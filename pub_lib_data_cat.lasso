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



		local:'dCoreCategories' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'catNum')))),(pair:'='=(pair:'category_approved'='1'))),(dcoremodtag_core_categories->setFields)->second,(pair:'category_menu_position'='ASC')));
		local:'dCoreContentPreAuth' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'='=(pair:'content_approved'='1')),(pair:'='=(pair:'category_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'catNum'))))),(dcoremodtag_core_content->setFields)->second));
		
		local:'dCoreContent' = (array);
		#dCoreContent->insert: (#dCoreContentPreAuth->get:1);
		#dCoreContent->insert: (#dCoreContentPreAuth->get:2);
		local:'dCoreData' = (array);
		
		iterate: #dCoreContentPreAuth->get:3, local:'authContent';
	
			if: #authContent->get:8->(split:',')->find:$sess_userGroup->size > 0;
				#dCoreData->insert:#authContent;
			/if;
			
		/iterate;
				
		#dCoreContent->insert:#dCoreData;
		
		var:'dCorePub_libBodyTmpl' = #dCoreCategories->get:3->get:1->get:5;
		
		var:'dCoreModAPI_Tmpl_output_mode' = #dCoreCategories->get:3->get:1->get:9;
		var:'dCoreModAPI_Tmpl_output_getTitle' = #dCoreCategories->get:3->get:1->get:2;
		var:'dCoreModAPI_Tmpl_output_getText' = #dCoreCategories->get:3->get:1->get:6;
		var:'dCoreModAPI_Tmpl_output_imgOne' = #dCoreCategories->get:3->get:1->get:12;
		
		
		var:'dCoreModAPI_Tmpl_output_conData' = #dCoreContent;
	
		var:'dCoreModAPI_Tmpl_output_listingStart' 	= 1;
		var:'dCoreModAPI_Tmpl_output_listingEnd' 	= 5;
		
		
/inline;		
		
?>