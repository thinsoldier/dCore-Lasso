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


local:'dCoreUserGroupRecord' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))))),(dCoreModTag_core_userGroups->setFields->second)));
local:'dCoreUserRecord' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'='000000'))),(dCoreModTag_core_userAccounts->setFields->second)));
local:'dCoreUserRecordPerms' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'userGroup_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'ugnum'))))),(dCoreModTag_core_userGroupsPerms->setFields->second)));


'\n<form enctype="multipart/form-data" action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acur') + '" method="post">';

	include:(LassoApp_Link:'adm_user_ae_layout.lasso');
	
	'\n<input type="hidden" name="ugnum" value="' + (var:'ugnum') + '">';
	'\n<table border="0" width="746">';
		
		'\n<tr>';
		'\n<td valign="top" width="746" colspan="2">';
		'\n<input type="submit"  value="Create User">';
		'\n</td>';
		'\n</tr>';
	'\n</table>';
'\n</form>';

?>