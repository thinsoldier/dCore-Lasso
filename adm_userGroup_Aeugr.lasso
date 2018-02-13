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

		
local: 'dCoreUpdateFields' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(dCoreModTag_core_userGroups->setLocal),(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum')))))));
	
var:'userGroup_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'));

local:'dCoreFoundSetPerms' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'userGroup_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))))),(dCoreModTag_core_userGroupsPerms->setFields)->second));


local: 'dCoreUpdateFieldsPerms' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_userGroupsPerms->setLocal),(array: (pair:'='=(pair:'id'=(#dCoreFoundSetPerms->get:3->get:1->get:1))))));


local:'dCoreFoundSet' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))))),(dCoreModTag_core_userGroups->setFields)->second));
local:'dCoreFoundSetPerms' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'userGroup_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))))),(dCoreModTag_core_userGroupsPerms->setFields)->second));


include:(lassoapp_link:'adm_userGroup_view_layout.lasso');

?>