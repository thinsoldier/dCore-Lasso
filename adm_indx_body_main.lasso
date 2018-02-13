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




'<table border="0" width="746">';
	'<tr valign="top">';
	'<td valign="top" width="746">';
		dCoreModTag_hd746grey:'Administration',-encodenone;
		'<table border="0"width="746" >';
		'<tr valign="top">';
		'<td valign="top">';
		'<b>Date:</b> ';date_format:date_getcurrentdate,-format='%d %B %Y';
		'</td>';
		
		'</tr>';
		'</table>';
	'</td>';
	'<td valign="top" width="241" rowspan="7">';
		dCoreModTag_hd241Grey:'Approval',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;</td>';
		'<td bgcolor="#ffffff" align="center"><img src="dCoreIMG_core/icon_tick.gif" border="0"></td>';
		'<td bgcolor="#ffffff" align="center"><img src="dCoreIMG_core/icon_cross.gif" border="0"></td>';
		'</tr>';
		
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>User Groups:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'userGroup_approved'=1))),(dCoreModTag_core_userGroups->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'userGroup_approved'=1))),(dCoreModTag_core_userGroups->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Users:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'user_approved'=1))),(dCoreModTag_core_userAccounts->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'user_approved'=1))),(dCoreModTag_core_userAccounts->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Sections:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'section_approved'=1))),(dCoreModTag_core_sections->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_sections',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'section_approved'=1))),(dCoreModTag_core_sections->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Categories:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'category_approved'=1))),(dcoremodtag_core_categories->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_categories',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'category_approved'=1))),(dcoremodtag_core_categories->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Pages:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'content_approved'=1))),(dcoremodtag_core_content->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_content',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'content_approved'=1))),(dcoremodtag_core_content->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>File Categories:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_fileCat',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'fileCat_approved'=1))),(dCoreModTag_core_fileCat->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_fileCat',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'fileCat_approved'=1))),(dCoreModTag_core_fileCat->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Files:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'>'=(pair:'id'=0)),(pair:'='=(pair:'file_approved'=1))),(dCoreModTag_core_files->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'>'=(pair:'id'=0)),(pair:'<>'=(pair:'file_approved'=1))),(dCoreModTag_core_files->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'</table>';
		include: (lassoapp_link:'adm_modulemenu.lasso');
	'</td>';
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="746">';
		dCoreModTag_hd746Blue:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'usrarea')+'" class="title">Users</a>',-encodenone;
		'<table border="0"><tr><td valign="top">';
		'<img src="dCoreIMG_core/icon_user.gif" border="0">&nbsp;To create, edit or delete User Groups or individual Users from your application.';
		'</td></tr></table>';
		
	'</td>';
	
	'</tr>';
	'<tr valign="top">';
	'<td valign="top" width="746">';
		dCoreModTag_hd746Green:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'conarea')+'" class="title">Content</a>',-encodenone;
		'<table border="0"><tr><td valign="top">';
		'<img src="dCoreIMG_core/icon_folder_open_cat.gif" border="0">&nbsp;To create, edit or delete Sections, Categories and Content from your application.';
		'</td></tr></table>';
	'</td>';
	'</tr>';	
	'<tr valign="top">';
	'<td valign="top" width="746">';
		dCoreModTag_hd746Orange:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'filearea')+'" class="title">Files</a>',-encodenone;
		'<table border="0"><tr><td valign="top">';
		'<img src="dCoreIMG_core/icon_content.gif" border="0">&nbsp;To create, edit or delete files that have been uploaded via your application.';
		'</td></tr></table>';
	'</td>';
	
	'</tr>';
	if: ($sess_userGroup == '1');
		'<tr valign="top">';
		'<td valign="top" width="746">';
			dCoreModTag_hd746Rust:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'homearea')+'" class="title">Homepage</a>',-encodenone;
			'<table border="0"><tr><td valign="top">';
			'<img src="dCoreIMG_core/icon_content_view.gif" border="0">&nbsp;Select content to be displayed on your homepage, or alter the master template for the application.';
			'</td></tr></table>';
			
		'</td>';
		'</tr>';
	/if;
	
	
		'<tr valign="top">';
		'<td valign="top" width="746">';
			dCoreModTag_hd746Purple:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'statsarea')+'" class="title">Statistics</a>',-encodenone;
			'<table border="0"><tr><td valign="top">';
			'<img src="dCoreIMG_core/icon_graphs.gif" border="0">&nbsp;Monitor the statistical data gathered via your application, including: Page Views, Referring Domains.';
			'</td></tr></table>';
			
		'</td>';
		
		'</tr>';
		
	
'</table>';

		
			

?>

