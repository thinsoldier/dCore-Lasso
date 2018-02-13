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





if: (file_uploads->size) > 0;
		inline: -username=(dCoreModTag_coreConfig->username),
			-password=(dCoreModTag_coreConfig->password);
			iterate: (file_uploads), (var:'fileGet');
				if: (var:'fileName') == '';
					var: 'fileName' = (dCoreAPI_upload->getRealname: $fileGet);
				/if;
				var: 'myImage' = (dCoreAPI_upload->getPath: $fileGet, (dCoreModTag_core_appinfo->getRootPath:'1'));
			/iterate;
			Var:'Binary'=(Include_Raw: $fileName);
			Var:'user_pictureFile'=(Image: -Binary=$Binary);
			if: (var:'picture') != '';
				file_delete: (dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCorePictures/' + $picture;
			/if;
			var:'picture' = dCoreAPI_dateTags->timestamp;
			$user_pictureFile->(Scale: -Width=110, -height=130, -Sample);
			$user_pictureFile->save: (dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCorePictures/' + $picture;
			file_delete: $filename;
		/inline;
		
		
/if;

// response page

var:'usergroup_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$ugnum);
var:'user_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$uanum);
var:'email_host' = (var:'emailaddress')->split: '@'->get:2;
var:'email_account' = (var:'emailaddress')->split: '@'->get:1;
	

		
local: 'dCoreUpdateFields' 		= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(dCoreModTag_core_userAccounts->setLocal),(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'uanum')))))));

	
local:'dCoreFoundSetPerms' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'user_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'uanum'))))),(dCoreModTag_core_usersPerms->setFields)->second));

if: #dCoreFoundSetPerms->get:2 == 0;
	
	local: 'dCoreInsertFieldsPerms'  = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_usersPerms->setLocal));
		
else;

	local: 'dCoreUpdateFieldsPerms' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_usersPerms->setLocal),(array: (pair:'='=(pair:'id'=(#dCoreFoundSetPerms->get:3->get:1->get:1))))));

/if;

local:'dCoreUserRecord' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'uanum'))))),(dCoreModTag_core_userAccounts->setFields)->second));

local:'dCoreUserRecordPerms' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(array: (pair:'='=(pair:'user_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'uanum'))))),(dCoreModTag_core_usersPerms->setFields)->second));


include:(lassoapp_link:'adm_user_view_layout.lasso');

?>