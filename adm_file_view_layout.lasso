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
	'<td valign="top" width="746" colspan="2">';
		dCoreModTag_hd746Orange:'File Information',-encodenone;
		'<table border="0" width="746" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" width="120" align="left" nowrap>&nbsp;&nbsp;<b>File Name:</b></td>';
			'<td bgcolor="white" align="left">' + (#dCoreFiles->get:3->get:1->get:2) + '</td>';
		'</tr>';
			
		'</table>';
	'</td>';
	'<td valign="top" width="241">';
		dCoreModTag_hd241Grey:'Tasks',-encodenone;
		'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acfile') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:6)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Acfile') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:6)+'" class="body">Add File</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aefile') + '&filenum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_edit.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Aefile') + '&filenum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:1)+'" class="body">Edit File</a></td>';
			'<td bgcolor="white"><a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adfile') + '&filenum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:1)+'" class="body"><img src="dCoreIMG_core/icon_content_delete.gif" border="0"></a>&nbsp;<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Adfile') + '&filenum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:1)+'" class="body">Del File</a></td>';
					
		'</tr>';
		'</table>';
	'</td>';
	
	'</tr>';
	
	
	'<tr valign="top">';
	'<td valign="top" width="500" rowspan="2">';
		dCoreModTag_hd500Grey:'File Description',-encodenone;
		'<table border="0"  width="500" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td colspan="2" valign="top" bgcolor="#ffffff">';
			(#dCoreFiles->get:3->get:1->get:4);
			'</td>';
		'</tr>';
			
		'</table>';
	'</td>';
	
	'<td valign="top" width="241" rowspan="2" align="center">';
		dCoreModTag_hd241Grey:'Preview',-encodenone;
		
		if: (#dCoreFiles->get:3->get:1->get:9) >> 'image';
			'<p class="body"><a href="' + (dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreFiles->get:3->get:1->get:6) + '/' + (#dCoreFiles->get:3->get:1->get:2)'" target="blank"><img src="'+ (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + (#dCoreFiles->get:3->get:1->get:5) + '" border="0"></a></p>';
		else;
			'<p class="body"><a href="' + (dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreFiles->get:3->get:1->get:6) + '/' + (#dCoreFiles->get:3->get:1->get:2)'" target="blank" class="body">File Download</a><br><b>Size:</b> ' + (#dCoreFiles->get:3->get:1->get:12) + ' bytes</p>';
		/if;
			
	'</td>';
	
	'<td valign="top">';
	dCoreModTag_hd241Grey:'File Settings',-encodenone;
	'<table border="0" width="241" cellpadding="2" cellspacing="1" bgcolor="#000000">';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Enabled:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			(dCoreAPI_switchOnOff->tickCross:(#dCoreFiles->get:3->get:1->get:3));
			'</td>';
		'</tr>';
		'<tr valign="top">';
			'<td bgcolor="white" align="left" nowrap>&nbsp;&nbsp;<b>Category:</b></td>';
			'<td bgcolor="white" align="center" width="90">';
			'<a href="'+(lassoapp_link:'indexAdmin.lasso') + '?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Avfcat') + '&fcatnum='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), #dCoreFiles->get:3->get:1->get:6)+'" class="body">';
			dcoremodtag_core_fileCat->getTitle:(#dCoreFiles->get:3->get:1->get:6)->get:1;
			'</a></td>';
		'</tr>';
		
		
	'</table>';
	'</td>';
	
	
	'</tr>';
	
			
'</table>';

	
?>

