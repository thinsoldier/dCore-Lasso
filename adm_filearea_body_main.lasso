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



local:'dCoreFileCat' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_fileCat',(array: (pair:'>'=(pair:'id'=0))),(dCoreModTag_core_fileCat->setFields)->second));

'<table border="0" width="746">';
	
	'<tr valign="top">';
	'<td valign="top" width="746">';
		dCoreModTag_hd746orange:'File Categories',-encodenone;
		if: #dCoreFileCat->get:2 > 0;
			'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
				'<tr valign="top">';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>Category</b></td>';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>Files</b></td>';
				'<td bgcolor="#ffffff" valign="middle" align="center"><b>Enabled</b></td>';
				'</tr>';
			iterate: #dCoreFileCat->get:3, local:'dCoreFileCatRecord';
				'<tr valign="top">';
				'<td bgcolor="#ffffff"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avfcat') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFileCatRecord->get:1)+'" class="body">' + #dCoreFileCatRecord->get:2 + '</a></td>';
				'<td bgcolor="#ffffff" align="center">' + (dCoreModTag_moduleDb->(Count: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'fileCat_id'=(#dCoreFileCatRecord->get:1)))),(dCoreModTag_core_files->setFields)->second))->get:2 + '</td>';
				'<td bgcolor="#ffffff" align="center">' + (dCoreAPI_switchOnOff->tickCross:(#dCoreFileCatRecord->get:3)) + '</td>';
				'</tr>';
			/iterate;
			'</table>';
		/if;
		
	'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241orange:'<a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acfcat')+'">Create File Category</a>',-encodenone;
		dCoreModTag_hd241Grey:'Approval',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
		'<td bgcolor="#ffffff">&nbsp;</td>';
		'<td bgcolor="#ffffff" align="center"><img src="dCoreIMG_core/icon_tick.gif" border="0"></td>';
		'<td bgcolor="#ffffff" align="center"><img src="dCoreIMG_core/icon_cross.gif" border="0"></td>';
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
		
	'</td>';
	
	
	'</tr>'
	
	/*
	
	'<tr valign="top">';
	'<td valign="top" width="746">';
		dCoreModTag_hd746Grey:'User Files',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		
		'<tr valign="top">';
			'<td bgcolor="#ffffff" width="200" valign="middle" align="center"><b>User Group</b></td>';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Documents</b></td>';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Images</b></td>';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Movies</b></td>';
			'<td bgcolor="#ffffff" valign="middle" align="center"><b>Other</b></td>';
		'</tr>';
		
		'</table>';
	'</td>';
	
	'</tr>';
	*/
	
'</table>';
?>

