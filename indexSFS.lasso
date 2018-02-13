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


		if: (var:'pg') == 'admarea';

			var:'adminArea'	= 'Home';
			var:'adminPageTitle'	= 'Main Administration';
			var:'adminPage' = include: (lassoapp_link:'adm_indx_body_main.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'conarea';

			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Content Main Administration';
			var:'adminPage' = include: (lassoapp_link:'adm_conarea_body_main.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	

		else: (var:'pg') == 'usrarea';

			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Users Main Administration';
			var:'adminPage' = include: (lassoapp_link:'adm_usrarea_body_main.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'filearea';

			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Files Main Administration';
			var:'adminPage' = include: (lassoapp_link:'adm_filearea_body_main.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			

		else: (var:'pg') == 'statsarea';

			var:'adminArea'	= 'Statistic';
			var:'adminPageTitle'	= 'Statistical Main Administration';
			var:'adminPage' = include: (lassoapp_link:'adm_statsarea_body_main.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			

		else: (var:'pg') == 'homearea';

			var:'adminArea'	= 'Home';
			var:'adminPageTitle'	= 'Home Page Main Administration';
			var:'adminPage' = include: (lassoapp_link:'adm_homearea_body_main.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Aehp';

			var:'adminArea'	= 'Homepage';
			var:'adminPageTitle'	= 'Homepage Area';
			var:'adminPage' = include: (lassoapp_link:'adm_homepage_Aehp.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
		
		else: (var:'pg') == 'Aehpr';
		
			var:'adminArea'	= 'Homepage';
			var:'adminPageTitle'	= 'Homepage Area';
			var:'adminPage' = include: (lassoapp_link:'adm_homepage_Aehpr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
		
		else: (var:'pg') == 'Avhp';
		
			var:'adminArea'	= 'Homepage';
			var:'adminPageTitle'	= 'Homepage Area';
			var:'adminPage' = include: (lassoapp_link:'adm_homepage_Avhp.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'Acug';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Create User Group';
			var:'adminPage' = include: (lassoapp_link:'adm_userGroup_Acug.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Acugr';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Create User Group Response';
			var:'adminPage' = include: (lassoapp_link:'adm_userGroup_Acugr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'Avug';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'View User Groups';
			var:'adminPage' = include: (lassoapp_link:'adm_userGroup_Avug.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aeug';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Edit User Group';
			var:'adminPage' = include: (lassoapp_link:'adm_userGroup_Aeug.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aeugr';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Edit User Group Response';
			var:'adminPage' = include: (lassoapp_link:'adm_userGroup_Aeugr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Adug';
			
			$adminColor = '#006699';
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Delete User Group';
			var:'adminPage' = include: (lassoapp_link:'adm_userGroup_Adug.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'Adugr';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Delete User Group';
			var:'adminPage' = include: (lassoapp_link:'adm_userGroup_Adugr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
	
	
			// User Pages
	
		else: (var:'pg') == 'Acu';
			
			$adminColor = '#006699';
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Create User';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Acu.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'Acur';

			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Create User Response';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Acur.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'Avu';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'View User';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Avu.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aeu';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Edit User';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Aeu.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aeur';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Edit User Response';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Aeur.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'Adu';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Delete User';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Adu.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Adur';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Delete User';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Adur.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
		
		else: (var:'pg') == 'Ausearchr';
		
			var:'adminArea'	= 'User';
			var:'adminPageTitle'	= 'Search Users';
			var:'adminPage' = include: (lassoapp_link:'adm_user_Ausearchr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
			// Section Pages
	
		else: (var:'pg') == 'Acs';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Create Section';
			var:'adminPage' = include: (lassoapp_link:'adm_section_Acs.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Acsr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Create Section Response';
			var:'adminPage' = include: (lassoapp_link:'adm_section_Acsr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Avs';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'View Section';
			var:'adminPage' = include: (lassoapp_link:'adm_section_Avs.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Aes';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Edit Section';
			var:'adminPage' = include: (lassoapp_link:'adm_section_Aes.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Aesr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Edit Section Response';
			var:'adminPage' = include: (lassoapp_link:'adm_section_Aesr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		
		else: (var:'pg') == 'Ads';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Delete Section';
			var:'adminPage' = include: (lassoapp_link:'adm_section_Ads.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Adsr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Delete Section';
			var:'adminPage' = include: (lassoapp_link:'adm_section_Adsr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			

			// Category Pages
			
		else: (var:'pg') == 'Accat';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Create Category';
			var:'adminPage' = include: (lassoapp_link:'adm_category_Accat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Accatr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Create Category Response';
			var:'adminPage' = include: (lassoapp_link:'adm_category_Accatr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Avcat';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'View Category';
			var:'adminPage' = include: (lassoapp_link:'adm_category_Avcat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Aecat';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Edit Category';
			var:'adminPage' = include: (lassoapp_link:'adm_category_Aecat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Aecatr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Edit Category Response';
			var:'adminPage' = include: (lassoapp_link:'adm_category_Aecatr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		
		else: (var:'pg') == 'Adcat';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Delete Category';
			var:'adminPage' = include: (lassoapp_link:'adm_category_Adcat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Adcatr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Delete Category';
			var:'adminPage' = include: (lassoapp_link:'adm_category_Adcatr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			

			// Content Pages
	
		else: (var:'pg') == 'Accon';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Create Content';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Accon.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Acconr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Create Content Response';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Acconr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Avcon';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'View Content';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Avcon.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Aecon';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Edit Content';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Aecon.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Aeconr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Edit Content Response';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Aeconr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Adcon';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Delete Content';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Adcon.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		else: (var:'pg') == 'Adconr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Delete Content';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Adconr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			// search
			
		else: (var:'pg') == 'Asearchr';
		
			var:'adminArea'	= 'Content';
			var:'adminPageTitle'	= 'Search Content';
			var:'adminPage' = include: (lassoapp_link:'adm_content_Asearchr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
		
		
			// file category pages
			
		else: (var:'pg') == 'Acfcat';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Create File Category';
			var:'adminPage' = include: (lassoapp_link:'adm_fileCat_Acfcat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Acfcatr';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Create File Category Response';
			var:'adminPage' = include: (lassoapp_link:'adm_fileCat_Acfcatr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Avfcat';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'View File Category';
			var:'adminPage' = include: (lassoapp_link:'adm_fileCat_Avfcat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aefcat';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Edit File Category';
			var:'adminPage' = include: (lassoapp_link:'adm_fileCat_Aefcat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aefcatr';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Edit File Category Response';
			var:'adminPage' = include: (lassoapp_link:'adm_fileCat_Aefcatr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			

		else: (var:'pg') == 'Adfcat';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Delete File Category';
			var:'adminPage' = include: (lassoapp_link:'adm_fileCat_Adfcat.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
					
		else: (var:'pg') == 'Adfcatr';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Delete File Category';
			var:'adminPage' = include: (lassoapp_link:'adm_fileCat_Adfcatr.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
			// file pages

		else: (var:'pg') == 'Acfile';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Upload File';
			var:'adminPage' = include: (lassoapp_link:'adm_file_Acfile.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Acfiler';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Upload File Response';
			var:'adminPage' = include: (lassoapp_link:'adm_file_Acfiler.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
	
		else: (var:'pg') == 'Avfile';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'View File';
			var:'adminPage' = include: (lassoapp_link:'adm_file_Avfile.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aefile';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Edit File';
			var:'adminPage' = include: (lassoapp_link:'adm_file_Aefile.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Aefiler';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Edit File Response';
			var:'adminPage' = include: (lassoapp_link:'adm_file_Aefiler.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		
		else: (var:'pg') == 'Adfile';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Delete File';
			var:'adminPage' = include: (lassoapp_link:'adm_file_Adfile.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
			
			
		else: (var:'pg') == 'Adfiler';
		
			var:'adminArea'	= 'File';
			var:'adminPageTitle'	= 'Delete File Response';
			var:'adminPage' = include: (lassoapp_link:'adm_file_Adfiler.lasso');
			var:'adminTemplate' = include: (lassoapp_link:'adm_template_1.lasso');
		
		else: (var:'pg') == 'Plogin';
				
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Welcome';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_auth.lasso');
		
		else: (var:'pg') == 'form';
		
			var:'page' = 'Rform';
			var:'adminPageTitle' = (var:'dCoreAPI_formForm_subject');
			var:'adminArea' = 'Public';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Pformr.lasso');
		
		else: 	(var:'pg') == 'Pcu';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Create Account';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Pcu.lasso');
		
		else: 	(var:'pg') == 'Pcontact';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Contact';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Pcontact.lasso');
		
		else: 	(var:'pg') == 'Pcontactr';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Contact';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Pcontactr.lasso');
		
		else: 	(var:'pg') == 'Pcur';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Create Account';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Pcur.lasso');
		
		else: 	(var:'pg') == 'Plpw';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Lost Password';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_user_Plpw.lasso');
		
		else: 	(var:'pg') == 'Psearchr';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Search Response';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Psearchr.lasso');
		
		else: 	(var:'pg') == 'Pccon';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Create';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Pccon.lasso');
		
		else: 	(var:'pg') == 'Pcconr';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Create';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Pcconr.lasso');
		
		else: 	(var:'pg') == 'Pecon';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Edit';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Pecon.lasso');
		
		else: 	(var:'pg') == 'Peconr';
			
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Edit';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Peconr.lasso');
		
		else: (var:'pg') != 'nav';
		
			var:'adminArea'	= 'Public';
			var:'adminPageTitle'	= 'Welcome';
			var:'dCoreModAPI_Tmpl_output_getText' = include: (lassoapp_link:'pub_content_Phome.lasso');
			
		/if;
	
	
?>