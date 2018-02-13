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
	
if: (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_fileCat',(array: (pair:'='=(pair:'fileCat_name'=(var:'name')))),(dCoreModTag_core_fileCat->setFields)->second))->get:2 == 0;
	var: 'dt_created'	= dCoreAPI_dateTags->timestamp;
	var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
							
	local: 'dCoreInsertFields' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_fileCat',(dCoreModTag_core_fileCat->setLocal));
	
	if: (error_currenterror: -errorcode) == 0;

		var:'fileCat_id' = #dCoreInsertFields->get:2;
		inline: -Username=(dCoreModTag_coreConfig->username), 
			-Password=(dCoreModTag_coreConfig->password);

			if: file_exists: ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/') == false;  
			
				file_create: ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/'); 
				file_create: ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + 'index.lasso');
				file_write: ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + 'index.lasso'), '[redirect_url:\'' + (dCoreModTag_core_appinfo->getURLPath:'1') + '\']';
				
			/if;

		/inline;
		
		local: 'dCoreInsertFieldsPerms'  = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_fileCatPerms->setLocal));
		
	/if;
	
	local:'dCorefileCat' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_fileCat',(array: (pair:'='=(pair:'id'=$fileCat_id))),(dCoreModTag_core_fileCat->setFields)->second));
	
	var:'fCatnum' = (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $fileCat_id);
	
	include:(lassoapp_link:'adm_fileCat_view_layout.lasso');

else;
	
	dCoreModAPI_errors->Duplicate;

/if;

?>