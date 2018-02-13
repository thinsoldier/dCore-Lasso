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
// set perms

inline:	-Username=dCoreModTag_coreConfig->username, -Password=dCoreModTag_coreConfig->password;
var:'dt_startFormat' 		= (var:'contentstart_year')+(var:'contentstart_month')+(var:'contentstart_day')+(var:'contentstart_hour')+(var:'contentstart_min')+'00';
var:'dt_endFormat' 		= (var:'contentend_year') + (var:'contentend_month') + (var:'contentend_day')+ (var:'contentend_hour')+ (var:'contentend_min')+'99';
local: 'dCoreContent' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(array:'section_id','category_id','id')));
local: 'dCoreContentLink' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(array:'id')));

var:'section_id' 		= 	(#dCoreContent->get:3->get:1->get:1);
var:'category_id' 		= 	(#dCoreContent->get:3->get:1->get:2);


if: (var:'urlTitle') != '';
	var:'content_id' 		= (#dCoreContent->get:3->get:1->get:3);
	local: 'dCoreUpdateFieldsLink' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Links',(dCoreModTag_core_links->setLocal),(array: (pair:'='=(pair:'id'=#dCoreContentLink->get:3->get:1->get:1)))));
	
/if;

var:'template' 			= (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'template'));

local:'imgNum' = (array:'One','Two','Three','Four','Five');
loop:5;		
	if: ((var_defined: 'img' + (#imgNum->get:(loop_count))) == true) && !((var:'img' + (#imgNum->get:(loop_count))) >> 'xx') && ((var:'img' + (#imgNum->get:(loop_count)))->(split:'/')->(get:3) != '');
		inline: 
		-Username=(dCoreModTag_coreConfig->username), 
		-Password=(dCoreModTag_coreConfig->password);local:'imgC' + (#imgNum->get:(loop_count))  = 	(var:'img' + (#imgNum->get:(loop_count)))->(split:'dCoreThumbs/')->get:2;
		local:'imgC' + (#imgNum->get:(loop_count)) + 'Array' = 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'file_hash'=(var:'imgC' + (#imgNum->get:(loop_count)))))),(array: 'id','fileCat_id','file_name')))->get:3->Get:1;
		
		
		var: 'imgC' + (#imgNum->get:(loop_count)) + 'Size'  = 	image:((dCoreModTag_core_appinfo->getFilePath:'1') + ((local:'imgC' + (#imgNum->get:(loop_count)) + 'Array')->get:2) + '/' + ((local:'imgC' + (#imgNum->get:(loop_count)) + 'Array')->get:3));
		
		(var:'imgC' + (#imgNum->get:(loop_count)) + 'Size')->(Scale: -width=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:1, -Height=(dCoreAPI_runTag->infoImg:$template)->(get:1)->(second)->(split:'x')->get:2);
		(var:'imgC' + (#imgNum->get:(loop_count)) + 'Size')->(Save: ((dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreContent/' + (var:'imgC' + (#imgNum->get:(loop_count)))),-fileoverwrite);
		/inline;
	/if;
/loop;

var:'dt_start' 	= (integer: $dt_startFormat);
var:'dt_end' 	= (integer: $dt_endFormat);

local: 'dCoreUpdateFields' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(dcoremodtag_core_content->setLocal),(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum')))))));
		
	
local: 'dCoreContent' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connum'))))),(dcoremodtag_core_content->setFields)->second));
local:'dCoreContentLink' 	= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $connum)))),(dcoremodtag_core_links->setFields)->second));

/inline;
// close perms
include:(lassoapp_link:'adm_content_view_layout.lasso');

?>