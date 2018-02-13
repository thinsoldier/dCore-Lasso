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




?>
			<table border="0" width="100%" cellpadding="4" cellspacing="0">
				
				<tr >
					<td valign="top">
			
					<table border="0" width="100%" cellpadding="2" cellspacing="0">
					<tr>
					<td width="120"><font><b>First Name</b></font></td>
					<td><font><input type="text" name="firstname" size="25" value="[IF:(var:'pg') >> 'eu'][field:'user_firstname'][else][var:'firstname'][/if]">
					[If: ((var:'firstname')== '') && ((var: 'initialize') == 'true')]
					<font color="red">*</font>
					[/if]
					</font></td>
					</tr>
					<tr>
					<td width="120"><font><b>Last Name</b></font></td>
					<td><font><input type="text" name="lastname" size="25" value="[IF:(var:'pg') >> 'eu'][field:'user_lastname'][else][var:'lastname'][/if]">
					[If: ((var:'lastname')== '') && ((var: 'initialize') == 'true')]
					<font color="red" size="2">*</font>[/if]</font></td>
					</tr>
					<tr><Td colspan="2">&nbsp;</td></tr>
					<tr>
					<td width="120"><font><b>Email Address</b></font></td>
					<td><font><input type="text" name="emailaddress" size="40" value="[IF:(var:'pg') >> 'eu'][field:'user_emailaddress'][else][var:'emailaddress'][/if]">
					[If: ((var:'emailaddress')== '') && ((var: 'initialize') == 'true')]
					<font color="red" size="2">*</font>[/if]</td>
					</tr>
					<tr><Td colspan="2">&nbsp;</td></tr>
					
					<tr>
					<td width="120"><font><b>Telephone</b></font></td>
					<td><font><input type="text" name="telephone" size="25" value="[IF:(var:'pg') >> 'eu'][field:'user_telephone'][else][var:'telephone'][/if]">
					[If: ((var:'telephone')== '') && ((var: 'initialize') == 'true')]
					<font color="red" size="2">*</font>[/if]</font></td>
					</tr>
					
					
					<tr><td colspan="2">&nbsp;</td></tr>
					 
						<tr>
						<td width="120"><font><b>Password</b></font></td>
						<td><font><input type="password" name="password" size="15" value="[IF:(var:'pg') >> 'eu'][field:'user_password'][else][/if]">
						[If: ((var:'password')== '') && ((var: 'initialize') == 'true')]
						<font color="red" size="2">*</font>[/if]</font></td>
						</tr>
						<tr>
						<td width="120"><font><b>Confirm Password</b></font></td>
						<td><font><input type="password" name="password_test" size="15" value="[IF:(var:'pg') >> 'eu'][field:'user_password'][else][/if]">
						[If: ((var:'password')== '') && ((var: 'initialize') == 'true')]
						<font color="red" size="2">*</font>[/if]</font></td>
						</tr>
					
					</table>
				</td>
			</tr>
		</table>

&nbsp;<BR>