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

inline: -database=(dCoreModTag_coreConfig->database), -username=(dCoreModTag_coreConfig->username), -password=(dCoreModTag_coreConfig->password);


		if: $sess_accType == 'Child';
			local:'dCoreSections' 	= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'<>'=(pair:'section_child'='1')),(pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectNum'))))),(dcoremodtag_core_sections->setFields)->second,(pair:'section_menu_position'='DESC')));
		else;
			local:'dCoreSections' 	= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectNum'))))),(dcoremodtag_core_sections->setFields)->second,(pair:'section_menu_position'='DESC')));
		
		/if;
		var:'dCorePub_libBodyTmpl' = #dCoreSections->get:3->get:1->get:4;
		var:'dCoreModAPI_Tmpl_output_getText' = #dCoreSections->get:3->get:1->get:5;
		var:'dCoreModAPI_Tmpl_output_getTitle' = #dCoreSections->get:3->get:1->get:2;
		var:'dCoreModAPI_Tmpl_output_imgOne' = #dCoreSections->get:3->get:1->get:11;
		var:'dCoreModAPI_Tmpl_output_mode' = #dCoreSections->get:3->get:1->get:8;

/inline;	
?>