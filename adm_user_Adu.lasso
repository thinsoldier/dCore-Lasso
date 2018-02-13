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





						
local:'dCoreUserRecord' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'uanum'))))),(dCoreModTag_core_userAccounts->setFields)->second));
local:'dCoreUserRecordPerms' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'user_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'uanum'))))),(dCoreModTag_core_usersPerms->setFields)->second));



	include:(LassoApp_Link:'adm_user_view_layout.lasso');
'\n<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adur') + '" method="post">';
	
	'\n<input type="hidden" name="uanum" value="' + (var:'uanum') + '">';
	'\n<input type="hidden" name="ugnum" value="' + (var:'ugnum') + '">';
	'\n<table border="0" width="746">';
		
		'\n<tr>';
		'\n<td valign="top" width="500">';
			'\n<input type="submit"  value="Delete User Account">';
	
			
		'\n</td>';
		'\n</tr>';
	'\n</table>';
'\n</form>';

?>