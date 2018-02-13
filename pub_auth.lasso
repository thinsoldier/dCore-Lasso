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


// changes 21 jan 05 - changed term Username to Email Address (quick fix)

//'<p class="' + (dCoreModTag_tmplClass->content) + '">if you have forgotten this information, please click here.</p>';
'<table border="0" width="100%" cellpadding="0" cellspacing="0">';
	'<tr class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<td class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<b class="' + (dCoreModTag_tmplClass->sectionTitle) + '">Account Log-in</b>';
	'</td>';
	'</tr>';
	'<tr class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'&nbsp;';
	'</td>';
	'</tr>';
	'<tr class="' + (dCoreModTag_tmplClass->content) + '">';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<p class="' + (dCoreModTag_tmplClass->content) + '">Please enter your account <b class="' + (dCoreModTag_tmplClass->content) + '">Email Address</b> and <b>Password</b>.';
	'</td>';
	'</tr>';
	'<tr>';
	'<td align="left" valign="middle" class="' + (dCoreModTag_tmplClass->content) + '">';
	'\n<form action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Pcur') + '" method="post">';
	'<p align=left>';
	(var:'joinError');
	'<table border="0">';
	
	
	'<tr class="' + (dCoreModTag_tmplClass->content) + '">';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<b class="' + (dCoreModTag_tmplClass->content) + '">Email Address</b>';
	'</td>';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<input type="text" name="un" class="' + (dCoreModTag_tmplClass->content) + '" value="' + (var:'un') + '">';
	'</td>';
	'</tr>';
	'<tr>';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<b class="' + (dCoreModTag_tmplClass->content) + '">Password</b>';
	'</td>';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<input type="password" name="pw" class="' + (dCoreModTag_tmplClass->content) + '">';
	'</td>';
	'</tr>';
	'<tr class="' + (dCoreModTag_tmplClass->content) + '">';
	'<td colspan="2" align="right" class="' + (dCoreModTag_tmplClass->content) + '">';
	'<input type="submit" value="Log-In">';
	'</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';
'</table>';
'</form>';


'<table border="0" width="100%" cellpadding="0" cellspacing="0">';
	'<tr class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<td class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<b class="' + (dCoreModTag_tmplClass->sectionTitle) + '">Lost Password</b>';
	'</td>';
	'</tr>';
	'<tr class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'&nbsp;';
	'</td>';
	'</tr>';
	'<tr class="' + (dCoreModTag_tmplClass->content) + '">';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<p class="' + (dCoreModTag_tmplClass->content) + '">If you can\'t remember your password and would like us to send it to you, please enter in your email address below and we will forward it to the email address.';
	'</td>';
	'</tr>';
	'<tr>';
	'<td align="left" valign="middle" class="' + (dCoreModTag_tmplClass->content) + '">';
	'\n<form action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Plpw') + '" method="post">';
	'<input type="hidden" name="lostPass" value="1">';
	'<p align=left>';
	(var:'joinError');
	'<table border="0">';
	
	
	'<tr class="' + (dCoreModTag_tmplClass->content) + '">';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<b class="' + (dCoreModTag_tmplClass->content) + '">Email Address</b>';
	'</td>';
	'<td class="' + (dCoreModTag_tmplClass->content) + '">';
	'<input type="text" name="emAddress" class="' + (dCoreModTag_tmplClass->content) + '" value="' + (var:'un') + '">';
	'</td>';
	'</tr>';
	
	'<tr class="' + (dCoreModTag_tmplClass->content) + '">';
	'<td colspan="2" align="right" class="' + (dCoreModTag_tmplClass->content) + '">';
	'<input type="submit" value="Request Password">';
	'</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';
'</table>';
'</form>';
?>