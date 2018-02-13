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




If: !(Lasso_TagExists: 'dCoreModTag_coreDb_boolean');
	define_tag:'dCoreModTag_coreDb_boolean';
	
		local:'dbCore_boolean_table' 		= (params->get:1);
		local:'dbCore_boolean_data'		= (params->get:2);
		local:'dbCore_boolean_returnFields'	= (params->get:3);
		local:'dbCore_boolean_matchfields'	= (params->get:4);
		local:'dbCore_boolean_keyword'		= (params->get:5);
		local:'dbCore_boolean_sql'		= 'SELECT ';
		local:'dbCore_boolean_fields'		= '';
		local:'dbCore_boolean_values'		= '';
		local:'dbCore_boolean_return'		= (array);
		
		iterate: #dbCore_boolean_returnFields, local: 'dbCore_boolean_returnFieldsItem';
					#dbCore_boolean_sql += #dbCore_boolean_returnFieldsItem;
					if: (loop_count) < #dbCore_boolean_returnFields->size;
						#dbCore_boolean_sql += ', ';
					/if;
		/iterate;
		
		#dbCore_boolean_sql +=	' FROM ' + dCoreModTag_coreConfig->database + '.' + #dbCore_boolean_table + ' WHERE ';
			
		#dbCore_boolean_sql +=	' MATCH (';
		
		iterate: #dbCore_boolean_matchfields, local: 'dbCore_boolean_matchfieldsItem';
					#dbCore_boolean_sql += #dbCore_boolean_matchfieldsItem;
					if: (loop_count) < #dbCore_boolean_matchfields->size;
						#dbCore_boolean_sql += ', ';
					/if;
		/iterate;
		
		#dbCore_boolean_sql +=	') ';
		
		#dbCore_boolean_sql +=	' AGAINST (\'';
		
		#dbCore_boolean_sql +=	#dbCore_boolean_keyword;
		
		#dbCore_boolean_sql +=	'\') ';
		
		
		if: #dbCore_boolean_data->size > 0;
		
			#dbCore_boolean_sql += ' AND ';
			
			iterate: #dbCore_boolean_data, local: 'dbCore_boolean_dataItem';
				//return: (#dbCore_boolean_dataItem->second)->second;
						#dbCore_boolean_sql += (#dbCore_boolean_dataItem->second)->first + ' ';
						#dbCore_boolean_sql += (#dbCore_boolean_dataItem->first) + ' ';
						#dbCore_boolean_sql += '\'' + (#dbCore_boolean_dataItem->second)->second + '\'';
						if: (loop_count) < #dbCore_boolean_data->size;
							#dbCore_boolean_sql += ' AND ';
						/if;
			/iterate;
		
		/if;
		
		inline: -database=dCoreModTag_coreConfig->database,
			-Table=#dbCore_boolean_table,
			-Username=(dCoreModTag_coreConfig->username), 
			-Password=(dCoreModTag_coreConfig->password),
			-sql=#dbCore_boolean_sql + ';';
				#dbCore_boolean_return->insert: (error_currenterror:-errorcode);
				#dbCore_boolean_return->insert: (keyfield_value);
			
		/inline;
		return: #dbCore_boolean_sql;
		
	/define_tag;
/if;


local:'dCoreContent' = (array);
local:'dCoreContentRecord' = (array);
if: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'keyword_section')) != '0';
	inline: -database=dCoreModTag_coreConfig->database,
	-Table='dCoreModdb_core_content',
	-Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password),
	-returnfield='id',
	-returnfield='content_title',
	-returnfield='content_text',
	-returnfield='content_intro',
	-returnfield='content_author',
	-returnfield='content_approved',
	-returnfield='section_id',
	-returnfield='category_id',
	-opbegin='or',
		-op='cn',
		'content_title'=(var:'keyword'),
		-op='cn',
		'content_text'=(var:'keyword'),
		-op='cn',
		'content_intro'=(var:'keyword'),
	-opend='or',
	-op='eq',
	'section_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'keyword_section')),
	-search;
	local:'foundCount' = found_count;
	local:'shownFirst' = shown_first;
	local:'shownLast' = shown_last;
	#dCoreContent->insert: (error_currenterror:-errorcode);
	#dCoreContent->insert:#foundCount;
	rows;
	#dCoreContentRecord->insert: (array: (field:'id'),(field:'content_title'),(field:'content_text'),(field:'content_intro'),(field:'category_id'),(field:'section_id'),(field:'content_author'),(field:'content_approved'));
	/rows;
	/inline;
	#dCoreContent->insert:#dCoreContentRecord;
	
else;
	inline: -database=dCoreModTag_coreConfig->database,
	-Table='dCoreModdb_core_content',
	-Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password),
	-returnfield='id',
	-returnfield='content_title',
	-returnfield='content_text',
	-returnfield='content_intro',
	-returnfield='content_author',
	-returnfield='content_approved',
	-returnfield='section_id',
	-returnfield='category_id',
	-opbegin='or',
		-op='cn',
		'content_title'=(var:'keyword'),
		-op='cn',
		'content_text'=(var:'keyword'),
		-op='cn',
		'content_intro'=(var:'keyword'),
	-opend='or',
	-search;
	local:'foundCount' = found_count;
	local:'shownFirst' = shown_first;
	local:'shownLast' = shown_last;
	#dCoreContent->insert: (error_currenterror:-errorcode);
	#dCoreContent->insert:#foundCount;
	rows;
	#dCoreContentRecord->insert: (array: (field:'id'),(field:'content_title'),(field:'content_text'),(field:'content_intro'),(field:'category_id'),(field:'section_id'),(field:'content_author'),(field:'content_approved'));
	/rows;
	/inline;
	#dCoreContent->insert:#dCoreContentRecord;
	

/if;


'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Grey:'<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td><font color="white">Results: Showing <b>' + #shownFirst + '</b> to <b>' + #shownLast + '</b> of <b>' + #foundCount + '</b> found.</td><td valign="top" align="right">Query: "<b>' + (var:'keyword') + '</b>"</td></tr></table>',-encodenone;
		if: #dCoreContent->get:2 > 0;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff"><b>Content</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Section</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Category</b></td>';
				//'<td bgcolor="#ffffff" align="center"><b>Author</b></td>';
				'</tr>';
			iterate: #dCoreContent->get:3, local:'dCoreContentRecord';
				'<tr valign="top">';
				'<td bgcolor="#ffffff"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avcon') + '&connum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreContentRecord->get:1)+'" class="body">' + #dCoreContentRecord->get:2 + '</a></td>';
				'<td bgcolor="#ffffff" align="center">' + dCoreModTag_core_sections->getTitle:(#dCoreContentRecord->get:6)->get:1 + '</td>';
				'<td bgcolor="#ffffff" align="center">' + dCoreModTag_core_categories->getTitle:(#dCoreContentRecord->get:5)->get:1 + '</td>';
				//'<td bgcolor="#ffffff" align="center">' + dCoreModTag_core_userAccounts->getUser:(#dCoreContentRecord->get:7->get:1) + ' ' + dCoreModTag_core_userAccounts->getUser:(#dCoreContentRecord->get:7->get:2) + '</td>';
				'</tr>';
			/iterate;
			'</table>';
		/if;
			
	'</td>';
	
	'</tr>';
			
'</table>';

	
?>

