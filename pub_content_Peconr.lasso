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
	
local: 'dCoreContent' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connumCcon'))))),(array:'section_id','category_id','id')));
local: 'dCoreContentLink' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connumCcon'))))),(array:'id')));

var:'section_id' 		= (#dCoreContent->get:3->get:1->get:1);
var:'category_id' 		= (#dCoreContent->get:3->get:1->get:2);


if: (var:'urlTitle') != '';
	var:'content_id' 		= (#dCoreContent->get:3->get:1->get:3);
	local: 'dCoreUpdateFieldsLink' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Links',(dCoreModTag_core_links->setLocal),(array: (pair:'='=(pair:'id'=#dCoreContentLink->get:3->get:1->get:1)))));
	
/if;

var:'template' 			= (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'template'));

if: ((var_defined: 'imgOne') == true) && !((var:'imgOne') >> 'xx') && ((var:'imgOne')->(split:'/')->(get:3) != '');
	inline: 
	-Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password);
	local:'imgCOne'  = 	(var:'imgOne')->(split:'dCoreThumbs/')->get:2;
	local:'imgCOneArray' = 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'file_hash'=$imgCOne))),(array: 'id','fileCat_id','file_name')))->get:3->Get:1;
	var:'imgCOneSize'  = 	image:((dCoreModTag_core_appinfo->getFilePath:'1') + (#imgCOneArray->get:2) + '/' + (#imgCOneArray->get:3));
	
	$imgCOneSize->(Scale: -width=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:1, -Height=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:2);
	$imgCOneSize->(Save: ((dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreContent/' + $imgCOne),-fileoverwrite);
	/inline;
/if;

var: 'approved'	= '0';
var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;

local: 'dCoreUpdateFields' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array:(pair:'content_approved'=(var:'approved')), (pair:'content_title'=(var:'title')), (pair:'content_text'=(var:'text')), (pair: 'content_dt_modified'=(var:'dt_modified')), (pair:'content_imgCOne'=(var:'imgCOne')), (pair:'content_fileOne'=(var:'fileOne'))),(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connumCcon')))))));
		
		
local: 'dCoreContent' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(dcoremodtag_core_content->setFields)->second));
local:'dCoreContentLink' 	= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $connum)))),(dcoremodtag_core_links->setFields)->second));


	'<p class="' + (dCoreModTag_tmplClass->contentText) + '"><b class="' + (dCoreModTag_tmplClass->contentText) + '">Content Submission</b></p>';

	'<p class="' + (dCoreModTag_tmplClass->contentText) + '">Thank you, your submission has been passed for approval.</p>';


?>