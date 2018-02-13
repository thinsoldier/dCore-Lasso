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

var:'maxrecords' = 5;
	/*
	
	
	*/

local:'dCoreContent' = (array);
local:'dCoreContentRecord' = (array);
if: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'keyword_section')) != '0';
	inline: -database=dCoreModTag_coreConfig->database,
	-Table='dCoreModdb_core_content',
	-Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password),
	-skiprecords=(var:'skiprecords'),
	-maxrecords=(var:'maxrecords'),
	-opbegin='or',
		-op='cn',
		'content_title'=(var:'keyword'),
		-op='cn',
		'content_text'=(var:'keyword'),
		-op='cn',
		'content_intro'=(var:'keyword'),
	-opend='or',
	-opbegin='and',
		-op='neq',
		'content_search'='1',
		-op='cn',
		'content_access'=$sess_usertype,
		-op='eq',
		'section_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'keyword_section')),
		-op='eq',
		'content_approved'='1',
		-op='lte', 
		'content_dt_start'=(integer:(dCoreAPI_dateTags->timestamp)),
		-op='gte', 
		'content_dt_end'=(integer:(dCoreAPI_dateTags->timestamp)), 
		
		-op='lte', 
		'content_dt_start'=(integer:(dCoreAPI_dateTags->timestamp)),
		-op='gte', 
		'content_dt_end'=(integer:(dCoreAPI_dateTags->timestamp)), 
			
	-opend='and',
	-sortfield='content_menu_position',
	-sortorder='ascending',
	-search;
	var:'skiprecords_value' = skiprecords_value;
	var:'skiprecords' = $maxrecords;
	var:'foundCount' = found_count;
	var:'shownFirst' = shown_first;
	var:'shownLast' = shown_last;
	#dCoreContent->insert: (error_currenterror:-errorcode);
	#dCoreContent->insert:#foundCount;
	rows;
	#dCoreContentRecord->insert: (array:	(field:'id'),
						(field:'content_title'),
						(field:'content_approved'),
						(field:'section_id'),
						(field:'category_id'),
						(field:'content_template'),
						(field:'content_text'),
						(field:'content_access'),
						(field:'content_menu_position'),
						(field:'content_mode'),
						(field:'content_dt_created'),
						(field:'content_dt_modified'),
						(field:'content_author'),	 	
						(field:'content_intro'),	
						(field:'content_dt_start'),  		
						(field:'content_dt_end'),  		
						(field:'content_priority'),
						(field:'content_imgCOne'),
						(field:'content_fileOne'));
	/rows;
	/inline;
	#dCoreContent->insert:#dCoreContentRecord;
	
else;
	inline: -database=dCoreModTag_coreConfig->database,
	-Table='dCoreModdb_core_content',
	-Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password),
	-skiprecords=(var:'skiprecords'),
	-maxrecords=(var:'maxrecords'),
	-opbegin='or',
		-op='cn',
		'content_title'=(var:'keyword'),
		-op='cn',
		'content_text'=(var:'keyword'),
		-op='cn',
		'content_intro'=(var:'keyword'),
	-opend='or',
	-opbegin='and',
		-op='neq',
		'content_search'='1',
		-op='cn',
		'content_access'=$sess_usertype,
		-op='eq',
		'content_approved'='1',
		-op='lte', 
		'content_dt_start'=(integer:(dCoreAPI_dateTags->timestamp)),
		-op='gte', 
		'content_dt_end'=(integer:(dCoreAPI_dateTags->timestamp)), 
		
		-op='lte', 
		'content_dt_start'=(integer:(dCoreAPI_dateTags->timestamp)),
		-op='gte', 
		'content_dt_end'=(integer:(dCoreAPI_dateTags->timestamp)), 
			
	-opend='and',
	-sortfield='content_menu_position',
	-sortorder='ascending',
	-search;
	var:'skiprecords_value' = skiprecords_value;
	var:'skiprecords' = $maxrecords;
	var:'foundCount' = found_count;
	var:'shownFirst' = shown_first;
	var:'shownLast' = shown_last;
	#dCoreContent->insert: (error_currenterror:-errorcode);
	#dCoreContent->insert:$foundCount;
	rows;
	#dCoreContentRecord->insert: (array:	(field:'id'),
						(field:'content_title'),
						(field:'content_approved'),
						(field:'section_id'),
						(field:'category_id'),
						(field:'content_template'),
						(field:'content_text'),
						(field:'content_access'),
						(field:'content_menu_position'),
						(field:'content_mode'),
						(field:'content_dt_created'),
						(field:'content_dt_modified'),
						(field:'content_author'),	 	
						(field:'content_intro'),	
						(field:'content_dt_start'),  		
						(field:'content_dt_end'),  		
						(field:'content_priority'),
						(field:'content_imgCOne'),
						(field:'content_fileOne'));
	/rows;
	/inline;
	#dCoreContent->insert:#dCoreContentRecord;
	

/if;
			'<table border="0" width="100%" class="' + (dCoreModTag_tmplClass->sectionTitle) +'" cellpadding="0" cellspacing="0">';
			'<tr class="' + (dCoreModTag_tmplClass->sectionTitle) +'">';
			'<td colspan="2" class="' + (dCoreModTag_tmplClass->sectionTitle) +'"><b class="' + (dCoreModTag_tmplClass->sectionTitle) +'">Search Results</b></td>';
			'</tr></table>';
'<table border="0" width="100%">';
	
	'<tr valign="top">';
	'<td valign="top" width="100%" colspan="2">';
		'<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td><b>Results:</b> Showing <b>' + $shownFirst + '</b> to <b>' + $shownLast + '</b> of <b>' + $foundCount + '</b> found for the query: "<b><i>';
		if:(var:'keyword') == '';
			'Empty';
		else;
			(var:'keyword');
		/if;
	'</i></b>"</td></tr></table>&nbsp;<br>';
	include:(lassoapp_link:'pub_content_nextPrev.lasso');
		if: #dCoreContent->get:2 > 0;
			
			
			'<table border="0" width="100%" cellpadding="2" cellspacing="1" bgcolor="#ffffff">';
				
			iterate: #dCoreContent->get:3, local: 'conDataRecord';
				
				'<tr class="' + (dCoreModTag_tmplClass->category) +'">';
				'<td rowspan="2" width="120" class="' + (dCoreModTag_tmplClass->category) + '">';
				if: (#conDataRecord->get:18) != '';
					'<img src="' + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' +  (#conDataRecord->get:18) + '" border="0">';
				else;
					'&nbsp;';
				/if;
				
				'</td>';
				'<td class="' + (dCoreModTag_tmplClass->category) + '"><a href="' + (lassoapp_link:'index.lasso') + '?pg=nav&conNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:1)) + '&catNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:5)) + '&sectNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:4)) + '" class="' + (dCoreModTag_tmplClass->category) + '"><b class="' + (dCoreModTag_tmplClass->category) + '" >' +  #conDataRecord->get:2 + '</b></a></td>';
				'</tr>';
				
				if: (#conDataRecord->get:10) == 'Text';
					'<tr class="' + (dCoreModTag_tmplClass->category) + '">';
					'<td class="' + (dCoreModTag_tmplClass->category) + '" valign="top">' +  (string_extract: -startposition=1,-endposition=150,(#conDataRecord->get:7)) + '...<a href="' + (lassoapp_link:'index.lasso') + '?pg=nav&conNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:1)) + '&catNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:5)) + '&sectNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:4)) + '" class="' + (dCoreModTag_tmplClass->category) + '"><i class="' + (dCoreModTag_tmplClass->category) + '">view</i>' + '</td>';
					'</tr>';
				else;
					'<tr class="' + (dCoreModTag_tmplClass->category) + '">';
					'<td class="' + (dCoreModTag_tmplClass->category) + '" valign="top">' +  (string_extract: -startposition=1,-endposition=150,(#conDataRecord->get:14)) + '...<a href="' + (lassoapp_link:'index.lasso') + '?pg=nav&conNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:1)) + '&catNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:5)) + '&sectNum=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#conDataRecord->get:4)) + '" class="' + (dCoreModTag_tmplClass->category) + '"><i class="' + (dCoreModTag_tmplClass->category) + '">view</i>' + '</td>';
					'</tr>';
				/if;
				
				
				'<tr class="' + (dCoreModTag_tmplClass->category) + '">';
				'<td valign="top" colspan="2" class="' + (dCoreModTag_tmplClass->category) + '">&nbsp;</td>';
				'</tr>';
			/iterate;
			
			
		/if;
include:(lassoapp_link:'pub_content_nextPrev.lasso');
			'</table>';
	'</td>';
	
	'</tr>';
			
'</table>';


?>
