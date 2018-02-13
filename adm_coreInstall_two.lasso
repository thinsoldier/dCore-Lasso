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





local:'dCoreSetFieldPair' = (pair:'appinfo_'=(array:'id','appinfo_sitename','appinfo_username','appinfo_password'));
local:'dCoreSetFieldLocal' = (dCoreModTag_setFields:#dCoreSetFieldPair);
local:'dCoreFoundSet' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',(array: (pair:'>'=(pair:'id'=0))),#dCoreSetFieldPair->second));

if: #dCoreFoundSet->get:2 > 0;
	// update
	
	if: (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',#dCoreSetFieldLocal,(array: (pair:'='=(pair:'id'=((dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',(array: (pair:'>'=(pair:'id'=0))),(array:'id')))->get:3->get:1->get:1))))))->get:1 != 0;'Update Error';/if;
else;
	
	// add
	if: dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_appinfo',#dCoreSetFieldLocal)->get:1 != 0;'Update Error';/if;
/if;


'\n<form action="' + (lassoapp_link:'indexAdmin.lasso') + '?pg=install3" method="post">';
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
   <td><img src="dCoreIMG_core/spacer.gif" width="71" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="19" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="86" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="35" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="6"><img name="dCoreInst_step2_r1_c1" src="dCoreIMG_core/dCoreInst_step2_r1_c1.jpg" width="500" height="60" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="60" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="8" colspan="2"><img name="dCoreInst_step2_r2_c1" src="dCoreIMG_core/dCoreInst_step2_r2_c1.jpg" width="289" height="273" border="0" alt=""></td>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="encrypt" size="20"></td>
   <td rowspan="10"><img name="dCoreInst_step2_r2_c6" src="dCoreIMG_core/dCoreInst_step2_r2_c6.jpg" width="35" height="340" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="23" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step2_r3_c3" src="dCoreIMG_core/dCoreInst_step2_r3_c3.jpg" width="176" height="49" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="49" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" bgcolor="#ffffff"><select name="usernameField"><option value="user_emailaddress">Email Address<option value="user_telephone">Telephone Number<option value="user_accNo">Account Number</select></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step2_r5_c3" src="dCoreIMG_core/dCoreInst_step2_r5_c3.jpg" width="176" height="47" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="47" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="session" size="20"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step2_r7_c3" src="dCoreIMG_core/dCoreInst_step2_r7_c3.jpg" width="176" height="62" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="62" border="0" alt=""></td>
  </tr>
  <tr>
   <td valign="top" bgcolor="#ffffff"><input type="text" name="session_time" size="5" value="30"></td>
   <td rowspan="2" colspan="2"><img name="dCoreInst_step2_r8_c4" src="dCoreIMG_core/dCoreInst_step2_r8_c4.jpg" width="105" height="44" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="dCoreInst_step2_r9_c3" src="dCoreIMG_core/dCoreInst_step2_r9_c3.jpg" width="71" height="20" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="20" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="dCoreInst_step2_r10_c1" src="dCoreIMG_core/dCoreInst_step2_r10_c1.jpg" width="252" height="67" border="0" alt=""></td>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="submit" value="Step Three >>"></td>
   <td rowspan="2"><img name="dCoreInst_step2_r10_c5" src="dCoreIMG_core/dCoreInst_step2_r10_c5.jpg" width="86" height="67" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="27" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_step2_r11_c2" src="dCoreIMG_core/dCoreInst_step2_r11_c2.jpg" width="127" height="40" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="40" border="0" alt=""></td>
  </tr>
</table>
<?lassoscript

'</form>';

?>