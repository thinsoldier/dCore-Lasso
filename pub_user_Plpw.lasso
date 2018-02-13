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

if: ((var:'emAddress') != '') && ((var:'lostPass') == '1');


	local: 'dCoreUser' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'user_emailaddress'=(var:'emAddress')))),(dcoremodtag_core_userAccounts->setFields)->second));
	
			if: (#dCoreUser->get:2) > 0;
			
					local:'user_id' 	= (#dCoreUser->get:3->get:1->get:1);
					local:'firstname' 	= (#dCoreUser->get:3->get:1->get:4);
					local:'lastname' 	= (#dCoreUser->get:3->get:1->get:5);
					local:'emailAddress' 	= (var:'emAddress');
					local:'password' 	= (#dCoreUser->get:3->get:1->get:9);
					
					
				 Email_Send: -From=(dCoreModTag_coreConfig->supportMail),
				    -To=#emailaddress,
	                            -CC=(var:'contactemail'),
	                            -Subject='Lost Password Information - ' + (dCoreModTag_core_appinfo->(getSitename:'1')),
	                            -Body='Dear ' + #firstname + ' ( ' + #emailAddress + ' )\n\nThank you for requesting your Password, we can confirm that the correct password to use is below:\n\n' + #password;
	               			
				
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
					'<p class="' + (dCoreModTag_tmplClass->content) + '">' + #firstname + ' , thank you! We have forwarded your password to the email address given, once collected please enter your account <b class="' + (dCoreModTag_tmplClass->content) + '">Email Address</b> and <b>Password</b>.';
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
					'<input type="text" name="un" class="' + (dCoreModTag_tmplClass->content) + '" value="' + (local:'emailaddress') + '">';
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
				
			else;
			
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
				'<p class="' + (dCoreModTag_tmplClass->content) + '">Unfortunately, we can\'t find an account with that email address, please try again.';
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


			/if;
else;

include: (lassoapp_link:'pub_auth.lasso');	

/if;
?>