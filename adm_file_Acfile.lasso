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



if: var('ftype') == '';

'\n<form enctype="multipart/form-data" action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acfile') + '" method="post"  name="con_form">';
	'<input type="hidden" name="fcatnum" value="' + $fcatnum + '">';
	
	
		'\n<table border="0" width="746">';
		
		'\n<tr>';
		'\n<td height="200" width="500" align=center valign=middle>';
		'\n<table border="0">';
		'\n<tr>';
		'\n<td>';
		'<input type="radio" name="ulType" value="single" checked>&nbsp;<b>Single File Upload Type</b>';
		'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="ftype" value="Image" checked>&nbsp;Single Image';
		'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="ftype" value="File">&nbsp;Single Non-Image';
		'\n<br><br></td>';
		'\n</tr>';
		
		'\n<tr>';
		'\n<td>';
		'<input type="radio" name="ulType" value="multi">&nbsp;<b>Multiple Files</b>';
		'\<br><br><input type="submit"  value="Select Upload Type">';
		'\n</td>';
		'\n</tr>';
		'\n</table>';
			
		'\n</td>';
		'\n</tr>';
	'\n</table>';
'\n</form>';

else;
						
local:'dCoreFileCat' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_fileCat',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'fcatnum'))))),(dCoreModTag_core_fileCat->setFields)->second));
local:'dCoreFiles' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'fileCat_id'=0))),(dCoreModTag_core_files->setFields)->second));


'\n<form enctype="multipart/form-data" action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acfiler') + '" method="post"  name="con_form">';
	'<input type="hidden" name="fcatnum" value="' + $fcatnum + '">';
	'<input type="hidden" name="ftype" value="' + $ftype + '">';
	
	if: (var:'ulType') == 'multi';
	include:(LassoApp_Link:'adm_fileMulti_ae_layout.lasso');
	else;
	include:(LassoApp_Link:'adm_file_ae_layout.lasso');
	/if;
		'\n<table border="0" width="746">';
		
		'\n<tr>';
		'\n<td valign="top" width="500">';
			'\n<input type="submit"  value="Upload File(s)">';
	
			
		'\n</td>';
		'\n</tr>';
	'\n</table>';
'\n</form>';

/if;







?>