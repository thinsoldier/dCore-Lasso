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



'<p class="' + (dCoreModTag_tmplClass->content) + '"><b>Edit Content</b></p>';



					
local:'dCoreContent' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Content',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'connumCcon'))))),(dcoremodtag_core_content->setFields)->second));

local:'dCoreContentLink' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $connumCcon)))),(dcoremodtag_core_links->setFields)->second));

var:'catnum' = (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContent->get:3->get:1->get:5));


'\n<form enctype="multipart/form-data" action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Peconr') + '" method="post" name="con_form">';


include:(LassoApp_Link:'Pub_Content_ae_layout.lasso');

'\n<input type="hidden" name="connumCcon" value="' + (var:'connumCcon') + '">';
'\n<input type="hidden" name="template" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreContent->get:3->get:1->get:6)) + '">';
'\n<table border="0" width="100%">';
	
	'\n<tr>';
	'\n<td valign="top" width="100%">';
		'\n<input type="submit"  value="Update Content">';

		
	'\n</td>';
	'</tr>';
	'</table>';
'\n</form>';

?>