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




if: (var:'title') == '';

	var:'title' = 'No Title Given';

/if;
	// response page
	var: 'approved'	= '0';
	var: 'dt_created'	= dCoreAPI_dateTags->timestamp;
	var: 'author'		= $sess_userid;
	var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
	var:'section_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectnumCcon'));
	var:'category_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'catnumCcon'));
	var:'template' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'template'));
	
if: ((var_defined: 'imgOne') == true) && !((var:'imgOne') >> 'xx') && ((var:'imgOne')->(split:'/')->(get:3) != '');
	inline: 
	-Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password);
	local:'imgCOne'  	= 	(var:'imgOne')->(split:'dCoreThumbs/')->get:2;
	local:'imgCOneArray' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'file_hash'=$imgCOne))),(array: 'id','fileCat_id','file_name')))->get:3->Get:1;
	var:'imgCOneSize'  	= 	image:((dCoreModTag_core_appinfo->getFilePath:'1') + (#imgCOneArray->get:2) + '/' + (#imgCOneArray->get:3));
	
	$imgCOneSize->(Scale: -width=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:1, -Height=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:2);
	$imgCOneSize->(Save: ((dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreContent/' + $imgCOne),-fileoverwrite);
	/inline;
/if;
if: (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'='=(pair:'content_title'=(var:'title')))),(dcoremodtag_core_content->setFields)->second))->get:2 == 0;
							
	local: 'dCoreInsertFields' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(dcoremodtag_core_content->setLocal));
	
	
	if: (error_currenterror: -errorcode) == 0;

		var:'content_id' = #dCoreInsertFields->get:2;
		if: (var:'urlTitle') != '';
			local: 'dCoreInsertFieldsLink' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(dcoremodtag_core_links->setLocal));
			
		/if;
	/if;
	
	local:'dCoreContent' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'='=(pair:'id'=$content_id))),(dcoremodtag_core_content->setFields)->second));
	local:'dCoreContentLink' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=$content_id))),(dcoremodtag_core_links->setFields)->second));
	
	var:'connum' = (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $content_id);
	
	'<p class="' + (dCoreModTag_tmplClass->contentText) + '"><b class="' + (dCoreModTag_tmplClass->contentText) + '">Content Submission</b></p>';

	'<p class="' + (dCoreModTag_tmplClass->contentText) + '">Thank you, your submission has been passed for approval.</p>';

else;
	
	dCoreModAPI_errors->Duplicate;

/if;

?>