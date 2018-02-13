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

local:'dCoreHomepage' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_homepage',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_homepage->setFields)->second));

if: ((#dCoreHomepage)->get:3->get:1->get:3) >> 'tmpl_homepage_';
	
	(dCoreAPI_runTag->display:((#dCoreHomepage)->get:3->get:1->get:3));
	
else;

		local:'dCoreSections' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'section_homepage'='1'))),(dCoreModTag_core_sections->setFields)->second));
				
								
		(dCoreAPI_textMode:(#dCoreHomepage->get:3->get:1->get:4), (#dCoreHomepage->get:3->get:1->get:5));
						
						
					
		if: (#dCoreSections->get:2) > 0;	
			
			'<table border="0" width="100%">';
				'<tr><td valign="top" width="' + (100 / (integer:#dCoreSections->get:2)) + '%">';
				iterate: (#dCoreSections->get:3), local:'dCoreSectionsItem';
				
					if: ($dCoreModAPI_homepage_securityCheck)->find: (#dCoreSectionsItem->(get:1))->size > 0;
						'<table border="0" width="100%">';
							'<tr>';
							'<td class="' + (dCoreModTag_tmplClass->homepageTitle) + '">';
								'<b>';
								#dCoreSectionsItem->get:2;
								'</b>';
							'</td>';
							'</tr>';
							
								local:'dCoreCategories' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'section_id'=(#dCoreSectionsItem->get:1))),(pair:'='=(pair:'category_homepage'='1'))),(dcoremodtag_core_categories->setFields)->second));
									iterate: (#dCoreCategories->get:3), local:'dCoreCategoriesItem';
										if: #dCoreCategories->get:2 > 0;
										
												local:'dCoreContent' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'<='=(pair:'content_dt_start'=(integer:(dCoreAPI_dateTags->timestamp)))),(pair:'>='=(pair:'content_dt_end'=(integer:(dCoreAPI_dateTags->timestamp)))),(pair:'='=(pair:'category_id'=(#dCoreCategoriesItem->get:1))),(pair:'='=(pair:'content_homepage'='1'))),(dcoremodtag_core_content->setFields)->second));
													iterate: (#dCoreContent->get:3), local:'dCoreContentItem';
														if: #dCoreContentItem->get:1 > 0;
															'<tr>';
															'<td>';
															'<a href="' + (lassoapp_link:'index.lasso') + '?pg=nav&conNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContentItem->get:1)) + '&catNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContentItem->get:5)) + '&sectNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContentItem->get:4)) + '" class="' + (dCoreModTag_tmplClass->categoryConTitle) + '"><i>' +  (#dCoreContentItem->get:2) + '</i></a>';
																'<br>';
																(string_extract: -startposition=1,-endposition=75,(#dCoreContentItem->get:7));'...';
																'<a href="' + (lassoapp_link:'index.lasso') + '?pg=nav&conNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContentItem->get:1)) + '&catNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContentItem->get:5)) + '&sectNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContentItem->get:4)) + '" class="' + (dCoreModTag_tmplClass->categoryConTitle) + '"><i>Read</i></a>';
																
															'</td>';
															'</tr>';
														/if;
													/iterate;
												
										/if;
									/iterate;
								
							'</td>';
							'</tr>';
						'</table>';
						
					/if;
				/iterate;
				'</td>';
				'</tr>';
			'</table>';
		
		/if;
		
/if;

?>