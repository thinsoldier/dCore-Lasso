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




local:'dCoreSetFieldPair' = (pair:'appinfo_'=(array:'id','appinfo_encrypt','appinfo_usernamefield','appinfo_session','appinfo_session_time'));
local:'dCoreSetFieldLocal' = (dCoreModTag_setFields:#dCoreSetFieldPair);
local:'dCoreFoundSet' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',(array: (pair:'>'=(pair:'id'=0))),#dCoreSetFieldPair->second));

if: #dCoreFoundSet->get:2 > 0;
	// update
	
	if: (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',#dCoreSetFieldLocal,(array: (pair:'='=(pair:'id'=((dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',(array: (pair:'>'=(pair:'id'=0))),(array:'id')))->get:3->get:1->get:1))))))->get:1 != 0;'Update Error';/if;
else;
	
	// add
	if: dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',#dCoreSetFieldLocal)->get:1 != 0;'Update Error';/if;
/if;


'\n<form action="' + (lassoapp_link:'indexAdmin.lasso') + '?pg=install4" method="post">';
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
   <td><img src="dCoreIMG_core/spacer.gif" width="27" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="8" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="6"><img name="dCoreInst_step3_r1_c1" src="dCoreIMG_core/dCoreInst_step3_r1_c1.jpg" width="500" height="50" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="50" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="10" colspan="2"><img name="dCoreInst_step3_r2_c1" src="dCoreIMG_core/dCoreInst_step3_r2_c1.jpg" width="289" height="283" border="0" alt=""></td>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="urlpath" size="30" value="http://[server_name][response_path]"></td>
   <td rowspan="12"><img name="dCoreInst_step3_r2_c6" src="dCoreIMG_core/dCoreInst_step3_r2_c6.jpg" width="8" height="350" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="23" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step3_r3_c3" src="dCoreIMG_core/dCoreInst_step3_r3_c3.jpg" width="203" height="29" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="29" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="filespath" size="30" value="dCorefiles/"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="23" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step3_r5_c3" src="dCoreIMG_core/dCoreInst_step3_r5_c3.jpg" width="203" height="33" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="33" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="fontpath" size="30" value="C://windows//fonts//"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="23" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step3_r7_c3" src="dCoreIMG_core/dCoreInst_step3_r7_c3.jpg" width="203" height="29" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="29" border="0" alt=""></td>
  </tr>
  <tr>
  <?lassoscript
  var:'rootPath' = (response_path);
  if: ($rootPath->beginswith:'/') == true;
  	$rootPath->removeleading:'/';
  /if;
  ?>
  
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="rootpath" size="30"  value="[response_path]"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="25" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step3_r9_c3" src="dCoreIMG_core/dCoreInst_step3_r9_c3.jpg" width="203" height="32" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="32" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="emailserver" size="30"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="23" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step3_r11_c3" src="dCoreIMG_core/dCoreInst_step3_r11_c3.jpg" width="203" height="43" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="43" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="dCoreInst_step3_r12_c1" src="dCoreIMG_core/dCoreInst_step3_r12_c1.jpg" width="252" height="67" border="0" alt=""></td>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="submit" value="Step Four >>"></td>
   <td rowspan="2" colspan="2"><img name="dCoreInst_step3_r12_c4" src="dCoreIMG_core/dCoreInst_step3_r12_c4.jpg" width="113" height="67" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="27" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_step3_r13_c2" src="dCoreIMG_core/dCoreInst_step3_r13_c2.jpg" width="127" height="40" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="40" border="0" alt=""></td>
  </tr>
</table>
<?lassoscript

'</form>';

?>