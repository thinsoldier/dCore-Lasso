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




	dCoreModTag_hd241Grey:'Search Users',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="241">';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>First Name:</b></td>';
				'<td bgcolor="white"><input type="text" name="firstname" value="'+(var:'firstname')+'"></td>';
			'</tr>';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Last Name:</b></td>';
				'<td bgcolor="white"><input type="text" name="lastname" value="'+(var:'lastname')+'"></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Telephone:</b></td>';
				'<td bgcolor="white"><input type="text" name="telephone" value="'+(var:'telephone')+'"></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Account Number:</b></td>';
				'<td bgcolor="white"><input type="text" name="accNo" value="'+(var:'accNo')+'"></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white" colspan="2">';
				'&nbsp;&nbsp;&nbsp;';
				'<select name="stype">';
				'<option value="cn">Any Match';
				'<option value="eq">Exact Match';
				'</select>';
				'&nbsp;<input type="submit" value="Search">';
				'</td>';
			'</tr>';
						
		'</table>';
		
?>