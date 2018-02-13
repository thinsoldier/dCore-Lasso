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


if: (var:'filespath') == ''; 	var:'filespath' = 'dCoreFiles/'; /if;
if: (var:'filespath')->(endswith:'/') == false; $filespath += '/'; /if;
		
		
inline: -Username=(dCoreModTag_coreConfig->username), 
	-Password=(dCoreModTag_coreConfig->password);
	
	if: file_exists: (var:'rootpath') + (var:'filespath') 				== false;  
		file_create: (var:'rootpath') + (var:'filespath');
		file_create: ((var:'rootpath') + (var:'filespath') + 'index.lasso');
		file_write: ((var:'rootpath') + (var:'filespath') + 'index.lasso'), '[redirect_url:\'' + (var:'URLpath') + '\']';
				
	/if;
	if: file_exists: (var:'rootpath') + (var:'filespath')  + 'dCoreCategories/' 	== false;  
		file_create: (var:'rootpath') + (var:'filespath') + 'dCoreCategories/';	
		file_create: ((var:'rootpath') + (var:'filespath') + 'dCoreCategories/' + 'index.lasso');
		file_write: ((var:'rootpath') + (var:'filespath') + 'dCoreCategories/' + 'index.lasso'), '[redirect_url:\'' + (var:'URLpath') + '\']';
		
	/if;
	if: file_exists: (var:'rootpath') + (var:'filespath')  + 'dCoreSections/' 	== false;  
		file_create: (var:'rootpath') + (var:'filespath') + 'dCoreSections/';
		file_create: ((var:'rootpath') + (var:'filespath') + 'dCoreSections/' + 'index.lasso');
		file_write: ((var:'rootpath') + (var:'filespath') + 'dCoreSections/' + 'index.lasso'), '[redirect_url:\'' + (var:'URLpath') + '\']';
			
	/if;
	if: file_exists: (var:'rootpath') + (var:'filespath')  + 'dCoreContent/' 	== false;  
		file_create: (var:'rootpath') + (var:'filespath') + 'dCoreContent/';
		file_create: ((var:'rootpath') + (var:'filespath') + 'dCoreContent/' + 'index.lasso');
		file_write: ((var:'rootpath') + (var:'filespath') + 'dCoreContent/' + 'index.lasso'), '[redirect_url:\'' + (var:'URLpath') + '\']';
				
	/if;
	if: file_exists: (var:'rootpath') + (var:'filespath')  + 'dCoreThumbs/' 	== false;  
		file_create: (var:'rootpath') + (var:'filespath') + 'dCoreThumbs/';
		file_create: ((var:'rootpath') + (var:'filespath') + 'dCoreThumbs/' + 'index.lasso');
		file_write: ((var:'rootpath') + (var:'filespath') + 'dCoreThumbs/' + 'index.lasso'), '[redirect_url:\'' + (var:'URLpath') + '\']';
				
	/if;
	if: file_exists: (var:'rootpath') + (var:'filespath')  + 'dCoreUsers/' 		== false;  
		file_create: (var:'rootpath') + (var:'filespath') + 'dCoreUsers/';	
		file_create: ((var:'rootpath') + (var:'filespath') + 'dCoreUsers/' + 'index.lasso');
		file_write: ((var:'rootpath') + (var:'filespath') + 'dCoreUsers/' + 'index.lasso'), '[redirect_url:\'' + (var:'URLpath') + '\']';
			
	/if;
	if: file_exists: (var:'rootpath') + (var:'filespath')  + 'dCorePictures/' 	== false;  
		file_create: (var:'rootpath') + (var:'filespath') + 'dCorePictures/';
		file_create: ((var:'rootpath') + (var:'filespath') + 'dCorePictures/' + 'index.lasso');
		file_write: ((var:'rootpath') + (var:'filespath') + 'dCorePictures/' + 'index.lasso'), '[redirect_url:\'' + (var:'URLpath') + '\']';
			
	/if;
	

/inline;

local:'dCoreSetFieldPair' = (pair:'appinfo_'=(array:'id','appinfo_urlpath','appinfo_filespath','appinfo_rootpath','appinfo_emailServer','appinfo_fontPath'));
local:'dCoreSetFieldLocal' = (dCoreModTag_setFields:#dCoreSetFieldPair);
//search for record count
// dbSearch
local:'dCoreFoundSet' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',(array: (pair:'>'=(pair:'id'=0))),#dCoreSetFieldPair->second));

if: #dCoreFoundSet->get:2 > 0;
	// update
	
	if: (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',#dCoreSetFieldLocal,(array: (pair:'='=(pair:'id'=((dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',(array: (pair:'>'=(pair:'id'=0))),(array:'id')))->get:3->get:1->get:1))))))->get:1 != 0;'Update Error';/if;
else;
	
	// add
	if: dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',#dCoreSetFieldLocal)->get:1 != 0;'Update Error';/if;
	
	
	
/if;

'\n<form action="' + (lassoapp_link:'indexAdmin.lasso') + '?pg=install5" method="post">';
'<table border="0">';
'<tr>';
'<td align="center" valign="middle" height="50">';
'&nbsp;';
'</td>';
'</tr>';
'</table>';
'<center>';
?>
<table border="0" cellpadding="0" cellspacing="0" width="500">
  <tr>
   <td><img src="dCoreIMG_core/spacer.gif" width="252" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="37" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="90" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="86" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="35" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="5"><img name="dCoreInst_step4_r1_c1" src="dCoreIMG_core/dCoreInst_step4_r1_c1.jpg" width="500" height="60" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="60" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="12" colspan="2"><img name="dCoreInst_step4_r2_c1" src="dCoreIMG_core/dCoreInst_step4_r2_c1.jpg" width="289" height="273" border="0" alt=""></td>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="text" name="firstname" size="20"></td>
   <td rowspan="14"><img name="dCoreInst_step4_r2_c5" src="dCoreIMG_core/dCoreInst_step4_r2_c5.jpg" width="35" height="340" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="23" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step4_r3_c3" src="dCoreIMG_core/dCoreInst_step4_r3_c3.jpg" width="176" height="9" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="9" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="text" name="lastname" size="20"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step4_r5_c3" src="dCoreIMG_core/dCoreInst_step4_r5_c3.jpg" width="176" height="13" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="13" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="text" name="title" size="20" value="Administrator"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step4_r7_c3" src="dCoreIMG_core/dCoreInst_step4_r7_c3.jpg" width="176" height="20" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="20" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="text" name="emailaddress" size="20" ></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step4_r9_c3" src="dCoreIMG_core/dCoreInst_step4_r9_c3.jpg" width="176" height="29" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="29" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="password" name="password" size="20"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step4_r11_c3" src="dCoreIMG_core/dCoreInst_step4_r11_c3.jpg" width="176" height="13" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="13" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="password" name="cpassword" size="20"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step4_r13_c3" src="dCoreIMG_core/dCoreInst_step4_r13_c3.jpg" width="176" height="46" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="46" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="dCoreInst_step4_r14_c1" src="dCoreIMG_core/dCoreInst_step4_r14_c1.jpg" width="252" height="67" border="0" alt=""></td>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="submit" value="Step Five >>"></td>
   <td rowspan="2"><img name="dCoreInst_step4_r14_c4" src="dCoreIMG_core/dCoreInst_step4_r14_c4.jpg" width="86" height="67" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="27" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step4_r15_c2" src="dCoreIMG_core/dCoreInst_step4_r15_c2.jpg" width="127" height="40" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="40" border="0" alt=""></td>
  </tr>
</table>
<?lassoscript
'</form>';

?>