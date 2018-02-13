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

var:'user_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'uanum'));
		
local: 'dCoreDeleteFields' 		= ((dCoreModTag_moduleDb_delete: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'=$user_id)))));
// DJC Fix: added to delete child accounts when parent is deleted

local: 'dCoreDeleteChild' 		= ((dCoreModTag_moduleDb_delete: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'user_master'=$user_id)))));
local: 'dCoreDeleteFieldsPerms' 	= ((dCoreModTag_moduleDb_delete: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'user_id'=$user_id)))));


include:(lassoapp_link:'adm_usrarea_body_main.lasso');

?>