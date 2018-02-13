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
	'<b class="' + (dCoreModTag_tmplClass->sectionTitle) + '">Contact Us</b>';
	'</td>';
	'</tr>';
'</table>';

var: 'contactemail' = (String_Replace: (var:'contactemail'), -Find=' ', -Replace='');



	If:	(((var:'contactname')	=='') 	||

		((var:'contactemail')	=='') 	||

		((var:'contactsubject')	=='') 	||

		((var:'contacttext')	==''));



		var:'proceed'='false';

	/If;

	If: (var: 'proceed') != 'false';
	
		Email_Send: -From=(dCoreModTag_coreConfig->supportMail),
			    -To=(dCoreModTag_coreConfig->supportMail),
                            -CC=(var:'contactemail'),
                            -Subject='Web Contact Form - ' + (var:'contactsubject'),
                            -Body='From ' + $contactname + ' ( ' + $contactemail + ' )\n\n' + (string_replace: -find='<BR>', -replace='\n',(var:'contacttext'),-encodenone);
                               
		'<P>Thank you ' + (var:'contactname') + ', your question or comment has been sent.</P>';
		'<P>You should also receive a copy for your records.</P>';

	else: (var: 'proceed') == 'false';
		'<P>Sorry, you did not complete the form in full.  Please check below and press send again.</p>';
		include:(lassoapp_link:'pub_content_Pcontact.lasso');
	/If;
	
		
	
	
?>