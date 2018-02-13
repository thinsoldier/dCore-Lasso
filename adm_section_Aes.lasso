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


							
local:'dCoreSections' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'sectnum'))))),(dCoreModTag_core_sections->setFields)->second));



	'\n<table border="0" width="746">';
	'\n<tr>';
	'\n<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aesr') + '" method="post" name="con_form"   onsubmit="return submitForm();">';

	'\n<input type="hidden" name="sectnum" value="' + (var:'sectnum') + '">';
	'\n<input type="hidden" name="menu_position" value="' + (#dCoreSections->get:3->get:1->get:7) + '">';
	'\n<input type="hidden" name="template" value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#dCoreSections->get:3->get:1->get:4)) + '">';
	'\n<td valign="top" width="746">';
		include:(LassoApp_Link:'adm_section_ae_layout.lasso');
	
			
		'\n</td>';
		'\n</tr>';
		'\n<tr>';
		'\n<td valign="top" width="746">';
			'\n<input type="submit"  value="Update Section">';
	
			
		'\n</td>';
		'\n</tr>';
	'\n</table>';
'\n</form>';

?>