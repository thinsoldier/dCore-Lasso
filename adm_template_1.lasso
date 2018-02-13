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
inline: -database=(dCoreModTag_coreConfig->database), -username=(dCoreModTag_coreConfig->username), -password=(dCoreModTag_coreConfig->password);


if: $sess_moderator == '1';



?><html>
	<head>
	<style>
	TD {color:#000000;font-size:10pt;font-family:arial, Geneva, Arial, Helvetica, san-serif;}
	TD.subNav {color:#000000;font-size:8pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
	TD.logout {color:#000000;font-size:8pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
	TD.body {color:#000000;font-size:10pt;font-family:arial, Geneva, Arial, Helvetica, san-serif;}
	B {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
	B.body {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
	B.subNav {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
	P {font-size:12pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
	P.body {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
	.news_headline { color: black; font-weight: bold; font-size: 14px; font-family: Tahoma, Verdana, Arial, Helvetica, Geneva, Swiss, SunSans-Regular }
	a { color: white; text-decoration: none }
	a:active { color: white; text-decoration:}
	a:visited { color: white; text-decoration: none }
	a:hover { color: #ffcc33; text-decoration: none}
	a.subNav { color: #000000; text-decoration: none }
	a.subNav:active { color: #000000; text-decoration:}
	a.subNav:visited { color: #000000; text-decoration: none }
	a.subNav:hover { color: red; text-decoration: none}
	a.body { color: #0066FF; text-decoration: none }
	a.body:active { color: #0066FF; text-decoration:}
	a.body:visited { color: #0066FF; text-decoration: none }
	a.body:hover { color: red; text-decoration: none}
	a.title { color: white; text-decoration: none }
	a.title:active { color: white; text-decoration:}
	a.title:visited { color: white; text-decoration: none }
	a.title:hover { color: #ffcc33; text-decoration: none}
	input { color: #000000; font-weight: normal; font-size: 10px; font-family: Tahoma, Verdana, Arial, Helvetica }
	textarea { color: #000000; font-weight: normal; font-size: 10px; font-family: Tahoma, Verdana, Arial, Helvetica; background-color: #ffffff }
	select { color: #000000; font-weight: bold; font-size: 10px; font-family: Tahoma, Verdana, Arial, Helvetica; background-color: #ffffff }
	.rteImage {
	background: #D3D3D3;
	border: 1px solid #D3D3D3;
	cursor: pointer;
	cursor: hand;
}

.rteImageRaised, .rteImage:hover {
	background: #D3D3D3;
	border: 1px outset;
	cursor: pointer;
	cursor: hand;
}

.rteImageLowered, .rteImage:active {
	background: #D3D3D3;
	border: 1px inset;
	cursor: pointer;
	cursor: hand;
}

.rteVertSep {
	margin: 0 4px 0 4px;
}

.rteBack {
	background: #D3D3D3;
	border: 1px outset;
	letter-spacing: 0;
	padding: 2px;
}

.rteBack tbody tr td, .rteBack tr td {
	background: #D3D3D3;
	padding: 0;
}

.rteDiv {
	display: block;
	position: relative;
}
	</style>
	<script language="JavaScript" type="text/javascript" src="dCoreRTE/richtext.js"></script>
	<script language="javascript">
	[html_comment]
		function showimage()
		{
		if (!document.images)
		return
		document.images.con_imgs.src=
		document.con_form.tmplnum.options[lb]document.con_form.tmplnum.selectedIndex[rb].value
		}
	//[/html_comment]
	</script>
	<script language="javascript">
	[html_comment]
		function showimgOne()
		{
		if (!document.images)
		return
		document.images.con_imgOne.src=
		document.con_form.imgOne.options[lb]document.con_form.imgOne.selectedIndex[rb].value
		}
	//[/html_comment]
	</script>
	<script language="javascript">
	[html_comment]
		function showimgTwo()
		{
		if (!document.images)
		return
		document.images.con_imgTwo.src=
		document.con_form.imgTwo.options[lb]document.con_form.imgTwo.selectedIndex[rb].value
		}
	//[/html_comment]
	</script>
	<script language="javascript">
	[html_comment]
		function showimgThree()
		{
		if (!document.images)
		return
		document.images.con_imgThree.src=
		document.con_form.imgThree.options[lb]document.con_form.imgThree.selectedIndex[rb].value
		}
	//[/html_comment]
	</script>
	<script language="javascript">
	[html_comment]
		function showimgFour()
		{
		if (!document.images)
		return
		document.images.con_imgFour.src=
		document.con_form.imgFour.options[lb]document.con_form.imgFour.selectedIndex[rb].value
		}
	//[/html_comment]
	</script>
	<script language="javascript">
	[html_comment]
		function showimgFive()
		{
		if (!document.images)
		return
		document.images.con_imgFive.src=
		document.con_form.imgFive.options[lb]document.con_form.imgFive.selectedIndex[rb].value
		}
	//[/html_comment]
	</script>
	<script language="JavaScript" type="text/javascript" src="dCoreRTE/richtext.js"></script>
	<title>[dCoreModTag_core_appinfo->getSitename:'1']: [$adminPageTitle]</title>
	<meta name="keywords" content="[dCoreModTag_core_appinfo->getKeywords:'1']">
	<meta name="description" content="[dCoreModTag_core_appinfo->getDescription:'1']">
	<meta name="generator" content="dCore version: [dCoreModAPI_core_version]">
	<meta http-equiv="refresh" content="[(integer:(dCoreModTag_core_appinfo->getSessionTime:'1')) * 60];url=http://[server_name][response_filepath]?pg=[Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'logout']">
			
	</head>
	<body bgcolor="#ffffff" leftmargin="0" topmargin="0">
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
	<td valign="top" width="750"><img src="dCoreIMG_core/[$adminArea].jpg" border="0"></td>
	<td align="left">
	<table border="0" width="100%">
	<tr><td><font size="1"><b>Account:</b></font></td><td><font size="1">[var:'sess_firstname'] [var:'sess_lastname']</font></td></tr>
	<tr><td><font size="1"><b>UserGroup:</b></font></td><td><font size="1">[dCoreModTag_core_userGroups->getTitle:(var:'sess_userGroup')->get:1]</font></td></tr>
	<tr><td><font size="1"><b>Module/Version:</b></font></td><td><font size="1">Core/[dCoreModAPI_core_version]</font></td></tr>
	</table>
	</td>
	<?lassoscript
		'<td align="center" vaign="top">';
		'<a href="' + (dCoreModTag_coreConfig->prefix) + 'App_core.LassoApp?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'logout')+'" class="title"><img src="dCoreIMG_core/icon_logout.gif" border="0" alt="Logout"></a>';
		'<br><a href="'+(lassoapp_link:'indexAdmin.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'admarea')+'" class="title"><img src="dCoreIMG_core/icon_home.gif" border="0" alt="Admin Home"></a>';
		'</td>';
	?>
	</tr>
	<tr>
	<td colspan="3" height="2" bgcolor="#000000"></td>
	</tr>
	</table>
	
	<?lassoscript
	
	include: (lassoapp_link:'adm_quickmenu.lasso');
		
	$adminPage;
		
	
	'</body>';
	'</html>';
	
	else;
	
		'<p>Sorry, access is NOT allowed to this area!</p>';
		'<p><a href="' + (LassoApp_Link:'index.lasso') + '?pg=' + (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Plogin') + '">Click Here</a></p>';

	/if;
	
	
	/inline;
	?>