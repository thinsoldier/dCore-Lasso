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





local:'dCoreFoundSet' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_userGroups->setFields)->second));




'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746" rowspan="3">';
		dCoreModTag_hd746Blue:'User Groups',-encodenone;
		if: #dCoreFoundSet->get:2 > 0;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff"><b>Group Name</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Parent Accounts</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Child Accounts</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Group Status</b></td>';
				'</tr>';
			iterate: #dCoreFoundSet->get:3, local:'dCoreFoundSetRecord';
			if: (#dCoreFoundSetRecord->get:1 == $sess_userGroup) || ($sess_userGroup == '1');
			
				'<tr valign="top">';
				'<td bgcolor="#ffffff"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avug') + '&ugnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFoundSetRecord->get:1)+'" class="body">' + #dCoreFoundSetRecord->get:2 + '</a></td>';
				'<td bgcolor="#ffffff" align="center">' + (dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'userGroup_id'=(#dCoreFoundSetRecord->get:1))), (pair:'='=(pair:'user_accType'='Parent'))),(dCoreModTag_core_userGroups->setFields)->second))->get:2 + '</td>';
				'<td bgcolor="#ffffff" align="center">' + (dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'userGroup_id'=(#dCoreFoundSetRecord->get:1))), (pair:'='=(pair:'user_accType'='Child'))),(dCoreModTag_core_userGroups->setFields)->second))->get:2 + '</td>';
				'<td bgcolor="#ffffff" align="center">' + (dCoreAPI_switchOnOff->tickCross:(#dCoreFoundSetRecord->get:3)) + '</td>';
				'</tr>';
			/if;	
				
			/iterate;
			'</table>';
		/if;
		
	'</td>';
	'<td valign="top" width="241" >';
		if: ($sess_userGroup == '1');
			dCoreModTag_hd241Blue:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acug')+'">Create User Group</a>',-encodenone;
		/if;
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
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'='=(pair:'userGroup_approved'='1'))),(dCoreModTag_core_userGroups->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">'
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(array: (pair:'<>'=(pair:'userGroup_approved'='1'))),(dCoreModTag_core_userGroups->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;<b>Users:</b></td>';
		'<td bgcolor="#ffffff" align="center">';
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'='=(pair:'user_approved'='1'))),(dCoreModTag_core_userGroups->setFields)->second))->get:2;
		'</td>';
		'<td bgcolor="#ffffff" align="center">'
		(dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'<>'=(pair:'user_approved'='1'))),(dCoreModTag_core_userGroups->setFields)->second))->get:2;
		'</td>';
		'</tr>';
		'</table>';
		
	'</td>';
	'</tr>';
	'<tr valign="top">';
	
	'<form action="' +(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Ausearchr')+'" method="post">';
	'<td valign="top" width="241">';
		include:(lassoapp_link:'adm_user_searchForm.lasso');
	'</td>';
	'</form>';
	'</tr>';
'</table>';
?>

