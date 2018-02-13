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
	
	
if: (var:'title') == '';

	var:'title' = 'No Title Given';

/if;
	var: 'dt_created'	= dCoreAPI_dateTags->timestamp;
	var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
				
	var:'template' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'template'));
if: ((var_defined: 'imgOne') == true) && !((var:'imgOne') >> 'xx') && ((var:'imgOne')->(split:'/')->(get:3) != '');
	inline: 
	-Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password);
	local:'imgSOne'  = 	(var:'imgOne')->(split:'dCoreThumbs/')->get:2;
	local:'imgSOneArray' = 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'file_hash'=$imgSOne))),(array: 'id','fileCat_id','file_name')))->get:3->Get:1;
	var:'imgSOneSize'  = 	image:((dCoreModTag_core_appinfo->getFilePath:'1') + (#imgSOneArray->get:2) + '/' + (#imgSOneArray->get:3));
	
	$imgSOneSize->(Scale: -width=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:1, -Height=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:2);
	$imgSOneSize->(Save: ((dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreSections/' + $imgSOne),-fileoverwrite);
	/inline;
/if;	
if: (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'section_title'=(var:'title')))),(dCoreModTag_core_sections->setFields)->second))->get:2 == 0;
							
	local: 'dCoreInsertFields' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(dCoreModTag_core_sections->setLocal));
	
	if: (error_currenterror: -errorcode) == 0;

		var:'section_id' = #dCoreInsertFields->get:2;
		
		local: 'dCoreInsertFieldsPerms'  = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_sectionPerms->setLocal));
		
	/if;
	local:'updateSessionState' = '1';
	include: (lassoapp_link:'conf_libs_sessions_lib.lasso');
	
	local:'dCoreSections' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'id'=$section_id))),(dCoreModTag_core_sections->setFields)->second));
	
	var:'sectnum' = (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $section_id);
	
	include:(lassoapp_link:'adm_section_view_layout.lasso');

else;
	
	dCoreModAPI_errors->Duplicate;

/if;

?>