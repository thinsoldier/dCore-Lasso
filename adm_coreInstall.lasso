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


include:(lassoapp_link:'adm_coreInstall_js.lasso');
'\n<form action="' + (lassoapp_link:'indexAdmin.lasso') + '?pg=install1" method="post">';
'<table border="0">';
'<tr>';
'<td align="center" valign="middle" height="50">';
'&nbsp;';
'</td>';
'</tr>';
'</table>';
'<center>';

if: (dCoreModAPI_core_status->db) == 1;	
	?>
	<table border="0" cellpadding="0" cellspacing="0" width="500">
  <tr>
   <td><img src="dCoreIMG_core/spacer.gif" width="36" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="157" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="307" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="dCoreInst_intro_r1_c1" src="dCoreIMG_core/dCoreInst_intro_r1_c1.jpg" width="500" height="305" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="305" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="dCoreInst_intro_r2_c1" src="dCoreIMG_core/dCoreInst_intro_r2_c1.jpg" width="36" height="95" border="0" alt=""></td>
   <td><a href="[lassoapp_link:'indexAdmin.lasso']?pg=install1" onMouseOut="MM_swapImgRestore();" onMouseOver="MM_swapImage('dCoreInst_intro_r2_c2','','dCoreIMG_core/dCoreInst_intro_r2_c2_f2.jpg',1);"><img name="dCoreInst_intro_r2_c2" src="dCoreIMG_core/dCoreInst_intro_r2_c2.jpg" width="157" height="20" border="0" alt=""></a></td>
   <td rowspan="2"><img name="dCoreInst_intro_r2_c3" src="dCoreIMG_core/dCoreInst_intro_r2_c3.jpg" width="307" height="95" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="20" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="dCoreInst_intro_r3_c2" src="dCoreIMG_core/dCoreInst_intro_r3_c2.jpg" width="157" height="75" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="75" border="0" alt=""></td>
  </tr>
</table>
	<?lassoscript
else;

	?><table border="0" cellpadding="0" cellspacing="0" width="500">
	  <tr>
	   <td><img src="dCoreIMG_core/spacer.gif" width="12" height="1" border="0" alt=""></td>
	   <td><img src="dCoreIMG_core/spacer.gif" width="185" height="1" border="0" alt=""></td>
	   <td><img src="dCoreIMG_core/spacer.gif" width="303" height="1" border="0" alt=""></td>
	   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="1" border="0" alt=""></td>
	  </tr>
	
	  <tr>
	   <td colspan="3"><img name="dCoreInst_noDb_r1_c1" src="dCoreIMG_core/dCoreInst_noDb_r1_c1.jpg" width="500" height="370" border="0" alt=""></td>
	   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="370" border="0" alt=""></td>
	  </tr>
	  <tr>
	   <td rowspan="2"><img name="dCoreInst_noDb_r2_c1" src="dCoreIMG_core/dCoreInst_noDb_r2_c1.jpg" width="12" height="30" border="0" alt=""></td>
	   <td><a href="http://[server_name]/lasso/databasebrowser.lassoapp" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','dCoreInst_noDb_r2_c2','dCoreIMG_core/dCoreInst_noDb_r2_c2_f2.jpg','dCoreIMG_core/dCoreInst_noDb_r2_c2_f4.jpg',1);" onClick="MM_nbGroup('down','navbar1','dCoreInst_noDb_r2_c2','dCoreIMG_core/dCoreInst_noDb_r2_c2_f3.jpg',1);"><img name="dCoreInst_noDb_r2_c2" src="dCoreIMG_core/dCoreInst_noDb_r2_c2.jpg" width="185" height="20" border="0" alt=""></a></td>
	   <td rowspan="2"><img name="dCoreInst_noDb_r2_c3" src="dCoreIMG_core/dCoreInst_noDb_r2_c3.jpg" width="303" height="30" border="0" alt=""></td>
	   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="20" border="0" alt=""></td>
	  </tr>
	  <tr>
	   <td><img name="dCoreInst_noDb_r3_c2" src="dCoreIMG_core/dCoreInst_noDb_r3_c2.jpg" width="185" height="10" border="0" alt=""></td>
	   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="10" border="0" alt=""></td>
	  </tr>
	</table><?lassoscript

/if;




'</form>';

?>