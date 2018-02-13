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


If: (var: 'from_form') != '1';
'<table border="0" width="100%">';
	'<tr class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<td class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<b class="' + (dCoreModTag_tmplClass->sectionTitle) + '">Contact Us</b>';
	'</td>';
	'</tr>';
'</table>';
'<p>If you would like to ask us a question or send us any comments, please complete the form below:</P>';

/if;

'<form action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Pcontactr') + '" method="post">';



'<input type="hidden" name="from_form" value="1">';

'<table border="0" width="100%">';
if:((var:'sess_usertype') != '_0') && ((var:'sess_usertype') != '');
	'<input type="hidden" name="contactname" value="' + (var:'sess_firstname') + ' ' + (var:'sess_lastname') + '">';
	'<input type="hidden" name="contactemail" value="' + (var:'sess_emailaddress') + '">';
else;
	'<tr>';
	'<td><B>Name:</B></td>';
	'<td>';
	'<input type="text" name="contactname" value="' + (var:'contactname') + '">';
	'</td>';
	'</tr>';
	'<tr>';
	'<td><B>Email Address:</B></td>';
	'<td>';
	'<input type="text" name="contactemail" value="' + (var:'contactemail') + '">';
	'</td>';
	'</tr>';
	'<tr>';
	'<td colspan="2">&nbsp;</td>';
	'</tr>';
/if;

'<tr>';
'<td><B>Subject:</B></td>';
'<td><input type="text" name="contactsubject" value="' + (var:'contactsubject') + '"></td>';
'</tr>';
'<tr>';
'<td colspan="2">&nbsp;</td>';
'</tr>';
'<tr>';
'<td colspan="2"><B>Questions or Comments:</B></td>';
'</tr>';
'<tr>';
'<td colspan="2"><textarea cols="40" rows="5" name="contacttext">'; (var:'contacttext',-encodebreak);'</textarea></td>';
'</tr>';
'<tr>';
'<td colspan="2"><input type="submit" value="Send"></td>';
'</tr>';
'</table>';
'</form>';

?>
