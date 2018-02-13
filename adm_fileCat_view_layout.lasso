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


local:'dCoreFiles' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'fileCat_id'=(#dCoreFileCat->get:3->get:1->get:1)))),(dCoreModTag_core_files->setFields)->second));

'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746">';
		dCoreModTag_hd746orange:'File Category Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>Heading:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreFileCat->get:3->get:1->get:2) + '</td>';
		'</tr>';
			
		'</table>';
		
	'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Tasks',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acfile') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFileCat->get:3->get:1->get:1) + '" class="body"><img src="dCoreIMG_core/icon_content_add.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acfile') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFileCat->get:3->get:1->get:1)+ '" class="body">Add File</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aefcat') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFileCat->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aefcat') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFileCat->get:3->get:1->get:1)+'" class="body">Edit Cat.</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adfcat') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFileCat->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_delete.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adfcat') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFileCat->get:3->get:1->get:1)+'" class="body">Del Cat.</a></td>';
					
		'</tr>';
		'</table>';
	'</td>';
	
	'</tr>';
	
	
	'<tr valign="top">';
	'<td valign="top" width="746" rowspan="2">';
		dCoreModTag_hd746Grey:'Category Text',-encodenone;
		'<table border="0"  width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff">';(#dCoreFileCat->get:3->get:1->get:4);'</td>';
		'</tr>';
			
		'</table>';
	'</td>';
	
	'</tr>';
	'<tr>';
		'<td valign="top">';
		dCoreModTag_hd241Grey:'Category Settings',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
			'<tr valign="top">';
				'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
				'<td bgcolor="white" align="center" width="90">';
				(dCoreAPI_switchOnOff->tickCross:(#dCoreFileCat->get:3->get:1->get:3));
				'</a></td>';
			'</tr>';
			
			
		'</table>';
		'</td>';
	'</tr>';
	
	'<tr valign="top">';
	'<td valign="top" width="746" rowspan="2">';
		dCoreModTag_hd746Grey:'Files',-encodenone;
		if: #dCoreFiles->get:2 > 0;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff"><b>File</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Type</b></td>';
				'<td bgcolor="#ffffff" align="center"><b>Status</b></td>';
				'</tr>';
			iterate: #dCoreFiles->get:3, local:'dCoreFilesRecord';
				'<tr valign="top">';
				'<td bgcolor="#ffffff"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avfile') + '&filenum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFilesRecord->get:1)+'" class="body">' + #dCoreFilesRecord->get:2 + '</a></td>';
				'<td bgcolor="#ffffff" align="center">' + (string_uppercase:(#dCoreFilesRecord->get:9)) + '</td>';
				'<td bgcolor="#ffffff" align="center">' + (dCoreAPI_switchOnOff->tickCross:(#dCoreFilesRecord->get:3)) + '</td>';
				'</tr>';
			/iterate;
			'</table>';
		/if;
			
	'</td>';
	
	'</tr>';
	'<tr>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Access Permissions',-encodenone;
		
			'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
					'<td bgcolor="#ffffff"><b>User Group</b></td>';
					'<td bgcolor="#ffffff" align="center"><b>U</b></td>';
					
				'</tr>';
				'<tr valign="top">';
					'<td bgcolor="#ffffff"><b>Public</b></td>';
					'<td bgcolor="#ffffff" align="center">';
					(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_fileCat->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$fcatnum))->find: ('_0')->size);
					'</td>';
					
				'</tr>';
				
				iterate: dCoreModTag_core_userGroups->getAll, local:'getAllItem';
				if: #getAllItem->get:2 != 'Administrator';
					'<tr valign="top">';
						'<td bgcolor="#ffffff"><b>' + #getAllItem->get:2 + '</b></td>';
						'<td bgcolor="#ffffff" align="center">';
						(dCoreAPI_switchOnOff->tickCross:(dCoreModTag_perms_fileCat->upload:(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),$fcatnum))->find: (#getAllItem->get:1)->size);
						'</td>';
						
					'</tr>';
				/if;
				/iterate;
				
				
				
			'</table>';
			
			
	'</td>';
	
	
	'</tr>';
	
			
'</table>';

	
?>

