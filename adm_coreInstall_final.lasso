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



'\n<form action="' + (dCoreModTag_coreConfig->prefix) + 'App_config.lassoapp?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'admarea') + '" method="post">';
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
   <td><img src="dCoreIMG_core/spacer.gif" width="264" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="71" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="23" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="71" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="40" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="20" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="11" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="7"><img name="dCoreInst_login_r1_c1" src="dCoreIMG_core/dCoreInst_login_r1_c1.jpg" width="500" height="19" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="19" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2" colspan="2"><img name="dCoreInst_login_r2_c1" src="dCoreIMG_core/dCoreInst_login_r2_c1.jpg" width="335" height="44" border="0" alt=""></td>
   <td colspan="3" valign="top" bgcolor="#ffffff"><p></p></td>
   <td rowspan="2" colspan="2"><img name="dCoreInst_login_r2_c6" src="dCoreIMG_core/dCoreInst_login_r2_c6.jpg" width="31" height="44" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="31" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_login_r3_c3" src="dCoreIMG_core/dCoreInst_login_r3_c3.jpg" width="134" height="13" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="13" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="8"><img name="dCoreInst_login_r4_c1" src="dCoreIMG_core/dCoreInst_login_r4_c1.jpg" width="264" height="242" border="0" alt=""></td>
   <td colspan="5" valign="top" bgcolor="#ffffff"><p>[client_ip]</p></td>
   <td rowspan="8"><img name="dCoreInst_login_r4_c7" src="dCoreIMG_core/dCoreInst_login_r4_c7.jpg" width="11" height="242" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="52" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="5"><img name="dCoreInst_login_r5_c2" src="dCoreIMG_core/dCoreInst_login_r5_c2.jpg" width="225" height="11" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="text" name="un"></td>
   <td rowspan="6" colspan="2"><img name="dCoreInst_login_r6_c5" src="dCoreIMG_core/dCoreInst_login_r6_c5.jpg" width="60" height="179" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="30" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_login_r7_c2" src="dCoreIMG_core/dCoreInst_login_r7_c2.jpg" width="165" height="22" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="22" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" bgcolor="#ffffff"><input type="password" name="pw"></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="31" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="dCoreInst_login_r9_c2" src="dCoreIMG_core/dCoreInst_login_r9_c2.jpg" width="165" height="19" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="19" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2" valign="top" bgcolor="#ffffff"><input type="submit" value="Log-in"></td>
   <td rowspan="2"><img name="dCoreInst_login_r10_c4" src="dCoreIMG_core/dCoreInst_login_r10_c4.jpg" width="71" height="77" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="27" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="2"><img name="dCoreInst_login_r11_c2" src="dCoreIMG_core/dCoreInst_login_r11_c2.jpg" width="94" height="50" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="50" border="0" alt=""></td>
  </tr>
</table>
<?lassoscript

'</form>';
?>	