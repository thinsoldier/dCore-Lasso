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



'<table border="0" width="100%">';
	'<tr class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<td class="' + (dCoreModTag_tmplClass->sectionTitle) + '">';
	'<b class="' + (dCoreModTag_tmplClass->sectionTitle) + '">Create Account</b>';
	'</td>';
	'</tr>';
'</table>';
if:  ((var:'rsp') == '1') && ((var:'uGroupTerms') != '1');
	'\n<form action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Pcu') + '" method="post">';
	'<input type="hidden" name="rsp" value="1">';
	'<p class="' + (dCoreModTag_tmplClass->content) + '">Please agree to the following Terms and Conditions.</p>';
	
	'<input type="hidden" name="uGroup" value="' + $ugroup + '">';
	'<textarea cols="40" rows="5">';
	((dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$uGroup)))),(array: 'id', 'userGroup_title','UserGroup_terms')))->get:3)->get:1->get:3;
	'</textarea>'
	'<p class="' + (dCoreModTag_tmplClass->content) + '"><input type="checkbox" name="uGroupTerms" value="1"> I Agree</p>';

else: ((var:'rsp') == '1') && ((var:'uGroupTerms') == '1') && ((Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'uGroup')) != '');
	(var:'joinError');
	'\n<form action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Pcur') + '" method="post">';
	'<input type="hidden" name="rsp" value="1">';
	'<input type="hidden" name="uGroup" value="' + $ugroup + '">';
	
	include: (lassoapp_link:'pub_user_ae_layout.lasso');

else;
	'\n<form action="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Pcu') + '" method="post">';
	'<input type="hidden" name="rsp" value="1">';

	'<p class="' + (dCoreModTag_tmplClass->content) + '">Please select the Account Type you wish to join.</p>';
	
	'<table border="0">';
	
	iterate: ((dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'='=(pair:'userGroup_createAccount'='1')),(pair:'='=(pair:'userGroup_approved'='1'))),(array: 'id', 'userGroup_title','UserGroup_text')))->get:3), local:'userGroupItem';
	'<tr>';
	'<td valign="top"><input type="radio" name="uGroup" ';
	
	if: (loop_count) == 1;
	
		' checked';
	
	/if;
	
	' value="' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#userGroupItem->get:1)) + '"></b>';
	'<td valign="top">&nbsp;</td>';
	'<td valign="top"><b>' + (#userGroupItem->get:2) + '</b></td>';
	'</tr>';
	'<tr>';
	'<td colspan="2" valign="top">&nbsp;</td>';
	'<td valign="top">' + (#userGroupItem->get:3) + '</td>';
	'</tr>';
	'<tr><td colspan="3">&nbsp;</td></tr>';
	/iterate;
	'</table>';

/if;
'<input type="submit" value="Proceed">';
'<input type="hidden" name="jform" value="1">';
	
'</form>';





?>