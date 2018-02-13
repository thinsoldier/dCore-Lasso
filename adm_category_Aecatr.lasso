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




// response page
if: (var:'name') == '';

	var:'name' = 'No Title Given';

/if;

local: 'dCoreCategories' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum'))))),(array:'section_id')));
local:'dCoreFoundSetPerms' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'category_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum'))))),(dCoreModTag_core_userGroupsPerms->setFields)->second));

var:'section_id' 			= (#dCoreCategories->get:3->get:1->get:1);

var:'template' 				= (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'template'));

	
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
			
local: 'dCoreUpdateFields' 		= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(dcoremodtag_core_categories->setLocal),(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum')))))));
local: 'dCoreUpdateFieldsPerms' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_userGroupsPerms->setLocal),(array: (pair:'='=(pair:'id'=(#dCoreFoundSetPerms->get:3->get:1->get:1))))));
	
local: 'dCoreCategories' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum'))))),(dcoremodtag_core_categories->setFields)->second));
local: 'dCoreCategoriesPerms' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'category_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum'))))),(dCoreModTag_core_userGroupsPerms->setFields)->second));


include:(lassoapp_link:'adm_category_view_layout.lasso');

?>