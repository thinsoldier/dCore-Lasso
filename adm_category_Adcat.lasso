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



						
local:'dCoreCategories' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_Categories',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'catnum'))))),(dcoremodtag_core_categories->setFields)->second));


	include:(LassoApp_Link:'adm_category_view_layout.lasso');
'\n<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adcatr') + '" method="post">';
	
	'\n<input type="hidden" name="catnum" value="' + (var:'catnum') + '">';
	'\n<input type="hidden" name="sectnum" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreCategories->get:3->get:1->get:4)) + '">';
	'\n<table border="0" width="746">';
		
		'\n<tr>';
		'\n<td valign="top" width="500">';
			'\n<input type="submit"  value="Delete Category">';
	
			
		'\n</td>';
		'\n</tr>';
	'\n</table>';
'\n</form>';

?>