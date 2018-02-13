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


if: (dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_userGroups->setFields)->second))->get:2 == 0;

	if: ((var:'firstname') != '') && ((var:'lastname') != '') && ((var:'title') != '') && ((var:'emailaddress') != '') && ((var:'password') != '');
		
		var:'approved' 	= '1';
		var:'accType' 	= 'Parent';
		var:'read' 	= '1';
		var:'write' 	= '1';
		var:'edit' 	= '1';
		var:'delete' 	= '1';
		var:'upload' 	= '1';
		var:'moderator' = '1';	
		var:'login' 	= '1';	
			
		local: 'dCoreInsertFields' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userGroups',(dCoreModTag_core_userGroups->setLocal));
		
		if: (error_currenterror: -errocode) == 0;

			var:'userGroup_id' = #dCoreInsertFields->get:2;
		
			local: 'dCoreInsertFieldsPerms'  = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_userGroupsPerms->setLocal));
			
				
							
			var:'email_host' = (var:'emailaddress')->split: '@'->get:2;
			var:'email_account' = (var:'emailaddress')->split: '@'->get:1;
		
			local: 'dCoreInsertFields' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_users',(dCoreModTag_core_userAccounts->setLocal));
			var:'userGroup_id' = '';	
			if: (error_currenterror: -errocode) == 0;
	
				var:'user_id' = #dCoreInsertFields->get:2;
				
				
				local: 'dCoreInsertFieldsPerms'  = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_userPermissions',(dCoreModTag_core_usersPerms->setLocal));
				
			/if;
			
			
		
		/if;
	/if;	
/if;
'\n<form action="' + (lassoapp_link:'indexAdmin.lasso') + '?pg=installf" method="post">';
'<table border="0">';
'<tr>';
'<td align="center" valign="middle" height="50">';
'&nbsp;';
'</td>';
'</tr>';
'</table>';
'<center>';
?>
<table border="0" cellpadding="0" cellspacing="0" width="500">
  <tr>
   <td><img src="dCoreIMG_core/spacer.gif" width="36" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="157" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="307" height="1" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="dCoreInst_step5_r1_c1" src="dCoreIMG_core/dCoreInst_step5_r1_c1.jpg" width="500" height="305" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="305" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="dCoreInst_step5_r2_c1" src="dCoreIMG_core/dCoreInst_step5_r2_c1.jpg" width="36" height="95" border="0" alt=""></td>
   <td><a href="[dCoreModTag_coreConfig->prefix]App_config.lassoapp"><img src="dCoreIMG_core/dCoreInst_step5_r2_c2.jpg" width="157" height="20" border="0" alt=""></a></td>
   <td rowspan="2"><img name="dCoreInst_step5_r2_c3" src="dCoreIMG_core/dCoreInst_step5_r2_c3.jpg" width="307" height="95" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="20" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="dCoreInst_step5_r3_c2" src="dCoreIMG_core/dCoreInst_step5_r3_c2.jpg" width="157" height="75" border="0" alt=""></td>
   <td><img src="dCoreIMG_core/spacer.gif" width="1" height="75" border="0" alt=""></td>
  </tr>
</table>
<?lassoscript
'</form>';

?>