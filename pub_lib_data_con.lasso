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


		local:'dCoreContent' 				= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'<='=(pair:'content_dt_start'=(integer:(dCoreAPI_dateTags->timestamp)))),(pair:'>='=(pair:'content_dt_end'=(integer:(dCoreAPI_dateTags->timestamp)))),(pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'conNum'))))),(dcoremodtag_core_content->setFields)->second,(pair:'content_menu_position'='ASC')));
		
		
		var:'dCorePub_libBodyTmpl' 			= #dCoreContent->get:3->get:1->get:6;
		
		
		var:'dCoreModAPI_Tmpl_output_mode' 		= #dCoreContent->get:3->get:1->get:10;
	
		var:'dCoreModAPI_Tmpl_output_getTitle' 		= #dCoreContent->get:3->get:1->get:2;
		var:'dCoreModAPI_Tmpl_output_getText' 		= #dCoreContent->get:3->get:1->get:7;
		var:'dCoreModAPI_Tmpl_output_imgOne' 		= #dCoreContent->get:3->get:1->get:18;
		var:'dCoreModAPI_Tmpl_output_imgTwo' 		= #dCoreContent->get:3->get:1->get:21;
		var:'dCoreModAPI_Tmpl_output_imgThree' 		= #dCoreContent->get:3->get:1->get:22;
		var:'dCoreModAPI_Tmpl_output_imgFour' 		= #dCoreContent->get:3->get:1->get:23;
		var:'dCoreModAPI_Tmpl_output_imgFive' 		= #dCoreContent->get:3->get:1->get:24;
		
		var:'dCoreModAPI_Tmpl_output_fileOne' 		= #dCoreContent->get:3->get:1->get:19;
		if: (integer: $dCoreModAPI_Tmpl_output_fileOne) > 0;
			local:'dCoreContentFile' 			= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'id'=(#dCoreContent->get:3->get:1->get:19)))),(dcoremodtag_core_files->setFields)->second));
			
			$dCoreModAPI_Tmpl_output_fileOne = '<table border="0" cellpadding=0 cellpadding=0>';
			$dCoreModAPI_Tmpl_output_fileOne += '<tr><td nowrap><a href="'+ (dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreContentFile->get:3->get:1->get:6) + '/' + (#dCoreContentFile->get:3->get:1->get:2)'" target="blank"><b>Download File</b></a></td></tr>';
			$dCoreModAPI_Tmpl_output_fileOne += '<tr><td nowrap><font size="1">' + (#dCoreContentFile->get:3->get:1->get:2) + '</font></td></tr>';
			$dCoreModAPI_Tmpl_output_fileOne += '<tr><td nowrap><font size="1"><b>Size: </b>' + (#dCoreContentFile->get:3->get:1->get:12) + ' bytes</font></td></tr>';
			$dCoreModAPI_Tmpl_output_fileOne += '</table>';
			
			
		/if;
		
		local:'dCoreContentLink' 			= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_links',(array: (pair:'='=(pair:'content_id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'conNum'))))),(dcoremodtag_core_links->setFields)->second));
		
		var:'dCoreModAPI_Tmpl_output_getLink' 		= #dCoreContentLink->get:3->get:1->get:3;
		var:'dCoreModAPI_Tmpl_output_getLinkText' 	= #dCoreContentLink->get:3->get:1->get:4;
		
/inline;		
	
?>