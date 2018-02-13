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




if: (var:'name') == '';

	var:'name' = 'No Title Given';

/if;
	// response page
	var: 'dt_created'	= dCoreAPI_dateTags->timestamp;
	var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
	var:'section_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectnum'));
	var:'template' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'template'));
	
if: ((var_defined: 'imgOne') == true) && !((var:'imgOne') >> 'xx') && ((var:'imgOne')->(split:'/')->(get:3) != '');
	inline: -Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password);
	local:'imgOne'  = 	(var:'imgOne')->(split:'dCoreThumbs/')->get:2;
	local:'imgOneArray' = 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'file_hash'=$imgOne))),(array: 'id','fileCat_id','file_name')))->get:3->Get:1;
	var:'imgOneSize'  = 	image:((dCoreModTag_core_appinfo->getFilePath:'1') + (#imgOneArray->get:2) + '/' + (#imgOneArray->get:3));
	
	$imgOneSize->(Scale: -width=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:1, -Height=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:2);
	$imgOneSize->(Save: ((dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreCategories/' + $imgOne),-fileoverwrite);
	/inline;
/if;

if: (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'category_name'=(var:'name'))),(pair:'='=(pair:'section_id'=(var:'section_id')))),(dcoremodtag_core_categories->setFields)->second))->get:2 == 0;
							
	local: 'dCoreInsertFields' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(dcoremodtag_core_categories->setLocal));
	
	if: (error_currenterror: -errorcode) == 0;

		var:'category_id' = #dCoreInsertFields->get:2;
		
		local: 'dCoreInsertFieldsPerms'  = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_categoryPerms->setLocal));
		
		
	/if;
	if: ((Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'sessup')) == '1');
	
		local:'updateSessionState' = '1';
		include: (lassoapp_link:'conf_libs_sessions_lib.lasso');
		
	/if;
	
	local:'dCoreCategories' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=$category_id))),(dcoremodtag_core_categories->setFields)->second));
	
	var:'catnum' = (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $category_id);
	
	include:(lassoapp_link:'adm_category_view_layout.lasso');

else;
	
	dCoreModAPI_errors->Duplicate;

/if;
?>