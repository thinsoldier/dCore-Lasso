<?lassoscript
/*#######################################################################
#									#
#	Application: 	dCore						#
#	Version: 	1.9.5						#
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


	
	
	local:'speedTimeStart' = (((Date)->second) * 1000) + (Date)->Millisecond;	

	// convert all (action_params) to variables
	
	Search_Arguments;
		var:(Search_FieldItem) = (Search_ValueItem);
	/Search_Arguments;
	
	// set the default usergroup to public mode '_0' indicates public
	var:'sess_userGroup' = '_0';
	
	
	
		/* 
		Include the configuration file AFTER  the search_args 
		statement to ensure anything placed in there can't be 
		overwritten and would create a security risk.
		*/
	
		include:(lassoapp_link:'conf_libs_config_lib.lasso');
		
		
	
		If: !(Lasso_TagExists: (dCoreModTag_coreConfig->prefix) + 'AppName_core');	
			define_tag: (dCoreModTag_coreConfig->prefix) + 'AppName_core', 	-description='Core Application';
				return: (dCoreModTag_coreConfig->prefix)  + 'App_core.lassoapp';
			/define_tag;
			
		/if;
		
		
		/*
		Check to see that the database exists if not show install
		page (database error), if it is there but no configuration
		record, show the installation page. Otherwise let the app
		run with pulling content.
		*/
		
		include: (lassoapp_link: 'conf_libs_dataCheck_lib.lasso');
		
		
		
		/* 
		Include the sessions file AFTER  the search_args 
		statement to ensure anything placed in there can't be 
		overwritten and would create a security risk.
		*/
		include:(lassoapp_link:'conf_libs_sessions_lib.lasso');
		
		
		
		
		// check to see the expiry date hasn't passed.
		
		if: (date_getCurrentDate)->(Difference: (date: ldml_srl_exp,-format='%Y-%m-%d')) > 0;
	
	
			// check to see that the user isn't banned with their IP address.
		
			if: dCoreModTag_security->tcpRead:(client_ip)->(find: $sess_usergroup)->(size) == 0;
	
			
				?>
				<html>
				<head>
				<link rel="icon" href="http://[server_name]/[response_path]favicon.ico">
				<link rel="SHORTCUT ICON" href="http://[server_name]/[response_path]favicon.ico">
				<meta http-equiv="refresh" content="[(integer:(dCoreModTag_core_appinfo->getSessionTime:'1')) * 60];url=http://[server_name][response_filepath]?pg=[Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'logout']">
				
				[include:(lassoapp_link:'conf_libs_style_lib.lasso')]
				
				<title>[dCoreModTag_core_appinfo->getSitename:'1']</title>
				 <meta name="keywords" content="[dCoreModTag_core_appinfo->getKeywords:'1']">
				 <meta name="description" content="[dCoreModTag_core_appinfo->getDescription:'1']">
				 <meta name="generator" content="Powered by dCore">
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
				<SCRIPT LANGUAGE="JavaScript">
					function loadImages() {
					if (document.getElementById) {  // DOM3 = IE5, NS6
					document.getElementById('hidepage').style.visibility = 'hidden';
					}
					else {
					if (document.layers) {  // Netscape 4
					document.hidepage.visibility = 'hidden';
					}
					else {  // IE 4
					document.all.hidepage.style.visibility = 'hidden';
					      }
					   }
					}
					
				</script>
			
				</head>
				[server_push]
				<?lassoscript
				'<body  ';
				//'background="masterImage/bg.gif"';
				' bgcolor="white" leftmargin="0" topmargin="0" ';
				//' OnLoad="loadImages()"';
				'>';
				//'<div id="hidepage" style="position: absolute; left:0px; top:0px; background-color: #FFFFFF; layer-background-color: #FFFFFF; height: 100%; width: 100%;"><table width="100%" height="70%" border="0"><tr><td valign="middle" align="center"><img src="dCoreIMG_core/dCoreemboss.gif" border="0"><BR><BR><font face="helv">Processing data....... Please wait.</font><BR><img src="dCoreIMG_core/loading.gif" border="0"></td></tr></table></div>';
				
				
				// check to see if the page is actually a form so don't decrypt
				
				if: ((var: 'pg') != 'form') && ((var: 'pg') != 'nav');
					
					// decrypt the $pg value for pulling the correct page in
					
					var: 'pg' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'pg'));
				
				/if;
				
				var: 'dCorePub_libNavTmpl' 	= (dCoreModTag_core_appinfo->getNavigation:'1')->get:1;
				var: 'dCorePub_libBodyTmpl' 	= 'dCoreTmpl_section_1';
				
				var: 'dCorePub_libNavAcc' 	= 'dCoreAcc_navigation_1';
				var: 'dCorePub_libBodyAcc' 	= 'dCoreAcc_content_1';
				var: 'dCore_vername' = ((response_filepath)->(split:'/')->(get:((response_filepath)->(split:'/'))->size));
				var: 'dCore_ver' = '';
				
			
				if: $dCore_vername >> '_';
					$dCore_ver = ((($dCore_vername)->(split:'_'))->(get:((($dCore_vername)->(split:'_'))->(size)))->(split:'.'))->(get:1);
					
				else;
					($dCore_ver = $dCore_vername);
				/if;
				
				if:	$sess_moderator == '1';
				
					var:'adminArea'	= 'Home';
					var:'adminPageTitle'	= 'Main Administration';
					var:'adminPage' = include: (lassoapp_link:'adm_indx_body_main.lasso');
					var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
					$adminTemplate;abort;	
						
					
					include:(lassoapp_link:'indexAdmin.lasso');
					
					
				else:  (dCoreModTag_core_appinfo->(getStatus:'1')) == '1';
				
					
					// finds what template to bring out against user's request
					if: (var:'pg') != 'Pccon';
					
						if: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'conNum')) != '';
							include:(lassoapp_link:'pub_lib_data_con.lasso');
							
							
						else: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'catNum')) != '';
							
							include:(lassoapp_link:'pub_lib_data_cat.lasso');
							
							
						else: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectNum')) != '';
							
							include:(lassoapp_link:'pub_lib_data_sect.lasso');
							
							
						/if;
					/if;	
					
					// 110 to here
					
						include: (lassoapp_link:'pub_lib_data_nav.lasso');
						
					// 220 to here
					
						include: (lassoapp_link:'pub_lib_data_searchBar.lasso');
						
					// 230 to here
					
					
					include: (lassoapp_link:'indexSFS.lasso');
					
					// 561 to here
							
							
							
					// output the master template
					(dCoreAPI_runTag->display:(dCoreModTag_core_appinfo->getMasterTemplate:'1'),-encodenone);
					
					// alternative code below but not used.
					
					//(\(dCoreModTag_core_appinfo->getMasterTemplate:'1'))->invoke->display;
					
					// 621 to here
					
					
				
				else;
					// show the under construction graphic
					
					include: (lassoapp_link:'pub_lib_construction.lasso');
				/if;
				
					
				
				// statistics gathering
				include:(lassoapp_link:'conf_libs_stats_lib.lasso');
		
				
				'</body>';
				'</html>';
			
			
			else;
			
				'<b>Your IP Address is blocked.</b>';
			
			/if;
					
			/*
				log: -window;
				
				'\n\nUser Online:\n\n';
				'Start Time: ' + (var:'sess_starttime') + '\n';
				'Time Now: ' + (dCoreAPI_dateTags->timestamp) + '\n';
				'Session: ' + (session_id: -name=(dCoreModTag_core_appinfo->getSession:'1')) + '\n';
				'IP Address: ' + (client_ip) + '\n';
				'Email Address: ' + ($sess_emailaddress) + '\n';
				'UserGroup: ' + (var:'sess_userGroup') + '\n';
				'Area: ' + (var:'adminArea') + '\n';
				
				
				/log;
			*/
			
			// when on this takes us to 1001
			// when off this takes us to 661
				
		else;
		
			'<b>Application Expired.</b>';
		
		/if;
	
		// average page load is 660 done on Winxp laptop with lp7.1.2
		
		
		
		if: (var:'showOutTime') == '123';
			local:'speedTimeEnd' = (((Date)->second) * 1000) + (Date)->Millisecond;	
			'<br>Start: = ';
			(integer:#speedTimeStart);
			'<br>End: = ';
			(integer:#speedTimeEnd);
			'<br>Time Taken: = ';
			(integer:#speedTimeEnd) - (integer:#speedTimeStart);
		/if;

	
	
?>