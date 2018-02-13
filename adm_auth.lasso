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




'\n<form action="' + (LassoApp_Link:'indexAdmin.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'admarea') + '" method="post">';
?>
<table border="0" height="80%" width="100%">

<tr>
<td align="center" valign="middle">
	<table border="0">
	<tr><td colspan="2">
<b>Welcome</b>
<br><br>The application you are attempting to access has been built to be<br>used with the Mozilla browser.
<br><br>To obtain a copy of the Mozilla browser, please visit<br><a href="http://www.mozilla.org/products/mozilla1.x/" class="body" target="_blank">www.Mozilla.org</a>.
</td>
</tr>
<tr><td colspan="2">
&nbsp;
</td>
</tr>
<tr>
	<td>
	<b>Username</b>
	</td>
	<td>
	<input type="text" name="un">
	</td>
	</tr>
	<tr>
	<td>
	<b>Password</b>
	</td>
	<td>
	<input type="password" name="pw">
	</td>
	</tr>
	<tr>
	<td>&nbsp;</td><td align="left">
	<input type="submit" value="Log-In">
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
</form>