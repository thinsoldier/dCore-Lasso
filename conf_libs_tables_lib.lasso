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

local:'dCoreSQLtable_dCoreModdb_core_content' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_content (
id int(11) auto_increment,
  content_title varchar(255) default \'\',
  content_template varchar(50) default \'\',
  content_text mediumtext,
  content_approved int(1) default \'0\',
  content_dt_created varchar(20) default \'\',
  content_dt_modified varchar(20) default \'0000-00-00 00:00:00\',
  content_mode varchar(5) default \'\',
  category_id varchar(11) default \'\',
  section_id varchar(11) default \'\',
  content_access varchar(100) default \'\',
  content_author varchar(11) default \'\',
  content_homepage varchar(11) default \'\',
  content_imgCOne varchar(255) default \'\',
  content_imgCTwo varchar(255) default \'\',
  content_imgCThree varchar(255) default \'\',
  content_imgCFour varchar(255) default \'\',
  content_imgCFive varchar(255) default \'\',
  content_uid varchar(11) default \'\',
  content_fileOne varchar(255) default \'\',
  content_fileTwo varchar(255) default \'\',
  content_fileThree varchar(255) default \'\',
  content_fileFour varchar(255) default \'\',
  content_fileFive varchar(255) default \'\',
  content_menu_position int(11) default \'\',
  content_search varchar(11) default \'0\',
  content_intro varchar(255) default \'\',
  content_dt_start bigint(14) default \'0\',
  content_dt_end bigint(14) default \'99999999999999\',
  content_priority varchar(11) default \'\',
  PRIMARY KEY  (id),
  KEY category_id (category_id),
  KEY content_template (content_template),
  KEY content_homepage (content_homepage),
  KEY content_access (content_access),
  KEY content_search (content_search),
  KEY content_author (content_author),
  KEY content_title (content_title),
  KEY content_intro (content_intro),
  FULLTEXT content_text (content_text),
  KEY content_dt_start (content_dt_start),
  KEY content_dt_end (content_dt_end),
  KEY section_id (section_id),
  KEY content_approved (content_approved),
  KEY content_mode (content_mode),
  KEY content_uid (content_uid)
) TYPE=MyISAM;';


local:'dCoreSQLtable_dCoreModdb_core_contentHistory' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_contentHistory (
id int(11) auto_increment,
  contentHistory_title varchar(100) default \'\',
  contentHistory_template varchar(100) default \'\',
  contentHistory_text mediumtext,
  contentHistory_approved int(1) default \'0\',
  contentHistory_dt_created varchar(20) default \'\',
  contentHistory_dt_modified varchar(20) default \'0000-00-00 00:00:00\',
  contentHistory_mode varchar(5) default \'\',
  category_id varchar(255) default \'\',
  section_id varchar(100) default \'\',
  contentHistory_access varchar(100) default \'\',
  contentHistory_author varchar(15) default \'\',
  contentHistory_homepage varchar(11) default \'\',
  contentHistory_imgCOne varchar(255) default \'\',
  contentHistory_imgCTwo varchar(255) default \'\',
  contentHistory_imgCThree varchar(255) default \'\',
  contentHistory_imgCFour varchar(255) default \'\',
  contentHistory_imgCFive varchar(255) default \'\',
  contentHistory_uid varchar(15) default \'\',
  contentHistory_fileOne varchar(15) default \'\',
  contentHistory_fileTwo varchar(15) default \'\',
  contentHistory_fileThree varchar(15) default \'\',
  contentHistory_fileFour varchar(15) default \'\',
  contentHistory_fileFive varchar(15) default \'\',
  contentHistory_menu_position varchar(15) default \'\',
  contentHistory_intro varchar(255) default \'\',
  contentHistory_dt_start bigint(14) default \'0\',
  contentHistory_dt_end bigint(14) default \'99999999999999\',
  contentHistory_priority varchar(255) default \'\',
  PRIMARY KEY  (id),
  KEY category_id (category_id),
  KEY contentHistory_template (contentHistory_template),
  KEY contentHistory_homepage (contentHistory_homepage),
  KEY contentHistory_access (contentHistory_access),
  KEY contentHistory_author (contentHistory_author),
  KEY contentHistory_dt_start (contentHistory_dt_start),
  KEY contentHistory_dt_end (contentHistory_dt_end),
  KEY section_id (section_id),
  KEY contentHistory_approved (contentHistory_approved),
  KEY contentHistory_mode (contentHistory_mode),
  KEY contentHistory_uid (contentHistory_uid)
) TYPE=MyISAM;';




local:'dCoreSQLtable_dCoreModdb_core_appInfo' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_appinfo (
id int(11) auto_increment,
  appinfo_encrypt varchar(50) default \'\',
  appinfo_session varchar(50) default \'\',
  appinfo_sitename varchar(100) default \'\',
  appinfo_emailserver varchar(255) default \'\',
  appinfo_usernameField varchar(255) default \'\',
  appinfo_rootpath varchar(100) default \'\',
  appinfo_fontpath varchar(255) default \'\',
  appinfo_keywords text,
  appinfo_description text,
  appinfo_username varchar(50) default \'\',
  appinfo_password varchar(50) default \'\',
  appinfo_status int(1) default \'0\',
  appinfo_urlpath varchar(100) default \'\',
  appinfo_lastmod timestamp,
  appinfo_filespath varchar(255) default \'\',
  appinfo_valid varchar(11) default \'0\',
  appinfo_session_time int(11) default \'0\',
  appinfo_navigation varchar(255) default \'dCoreTmpl_navigation_1\',
  appinfo_template varchar(100) default \'dCoreTmpl_master_1\',
  PRIMARY KEY  (id),
  KEY appinfo_valid (appinfo_valid),
  KEY appinfo_filespath (appinfo_filespath),
  KEY appinfo_password (appinfo_password),
  KEY appinfo_template (appinfo_template),
  KEY appinfo_username (appinfo_username)
) TYPE=MyISAM;';



local:'dCoreSQLtable_dCoreModdb_core_security' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_security (
id int(11) auto_increment,
security_expire_date datetime default \'0000-00-00 00:00:00\',
security_status int(11) default \'0\',
security_start_date datetime default \'0000-00-00 00:00:00\',
security_section varchar(11) default \'0\',
security_module varchar(11) default \'0\',
security_IP varchar(11) default \'0\',
security_email varchar(250) default \'\',
security_type varchar(250) default \'\',
security_read varchar(250) default \'\',
security_write varchar(250) default \'\',
security_title varchar(250) default \'\', 
security_file varchar(250) default \'\', 
security_text text,
security_lastview_date datetime default \'0000-00-00 00:00:00\',  
security_approved varchar(11) default \'0\',   
security_category varchar(250) default \'\',   
security_template varchar(250) default \'0\',   
security_uid varchar(11) default \'0\',  
security_tmplnum  varchar(250) default \'\',
security_access varchar(250) default \'0\', 
  PRIMARY KEY  (id),
  KEY security_ip (security_ip),
  KEY security_email (security_email),
  KEY security_read (security_read),
  KEY security_write (security_write),
  KEY security_type (security_type),
  KEY security_module (security_module),
  KEY security_tmplnum (security_tmplnum),
  KEY security_file (security_file),
  KEY security_category (security_category),
  KEY security_section (security_section),
  KEY security_expire_date (security_expire_date),
  KEY security_template (security_template),
  KEY security_access (security_access)
) TYPE=MyISAM;';


local:'dCoreSQLtable_dCoreModdb_core_sections' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_sections (
id int(11) auto_increment,
  section_title varchar(255) default \'\',
  section_menu_position int(11) default \'0\',
  section_template varchar(255) default \'0\',
  section_approved varchar(255) default \'0\',
  section_child varchar(11) default \'0\',
  section_homepage varchar(11) default \'0\',
  section_dt_created varchar(255) default \'\',
  section_dt_modified varchar(255) default \'\',
  section_text mediumtext,
  section_author varchar(255) default \'\',
  section_levels varchar(11) default \'1\',
  section_mode varchar(11) default \'0\',
  section_imgSOne varchar(255) default \'\',
  section_imgSTwo varchar(255) default \'\',
  section_imgSThree varchar(255) default \'\',
  section_imgSFour varchar(255) default \'\',
  section_imgSFive varchar(255) default \'\',
  PRIMARY KEY  (id),
  KEY section_approved (section_approved),
  KEY section_child (section_child),
  KEY section_homepage (section_homepage)
) TYPE=MyISAM;';



local:'dCoreSQLtable_dCoreModdb_core_dropdowns' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_dropdowns (
id int(11) auto_increment,
  dropdown_title varchar(255) default \'\',
  dropdown_seperator varchar(255) default \'0\',
  dropdown_type varchar(255) default \'0\',
  dropdown_content blob,
  dropdown_dt_created varchar(255) default \'\',
  dropdown_dt_modified varchar(255) default \'\',
  dropdown_text text,
  PRIMARY KEY  (id),
  KEY dropdown_title (dropdown_title),
  KEY dropdown_type (dropdown_type)  
) TYPE=MyISAM;';

local:'dCoreSQLtable_dCoreModdb_core_homepage' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_homepage (
id int(11) auto_increment,
  homepage_status varchar(255) default \'\',
  homepage_title varchar(255) default \'\',
  homepage_imgHOne varchar(255) default \'\',
  homepage_mode varchar(11) default \'html\',
  homepage_template varchar(255) default \'0\',
  homepage_option varchar(11) default \'0\',
  homepage_dt_created varchar(255) default \'\',
  homepage_dt_modified varchar(255) default \'\',
  homepage_text mediumtext,
  PRIMARY KEY  (id),
  KEY homepage_option (homepage_option),
  KEY homepage_status (homepage_status)  
) TYPE=MyISAM;';


local:'dCoreSQLtable_dCoreModdb_core_userGroups' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_userGroups (
id int(11) auto_increment,
  userGroup_title varchar(255) default \'\',
  userGroup_approved varchar(255) default \'0\',
  userGroup_dt_created varchar(255) default \'\',
  userGroup_dt_modified varchar(255) default \'\',
  userGroup_terms_option varchar(10) default \'0\',
  userGroup_login varchar(10) default \'0\',
  userGroup_createAccount varchar(10) default \'0\',
  userGroup_approvalAccount varchar(10) default \'0\',
  userGroup_text text,
  userGroup_terms text,
  PRIMARY KEY  (id),
  KEY userGroup_createAccount (userGroup_createAccount),
  KEY userGroup_login (userGroup_login),
  KEY userGroup_title (userGroup_title),
  KEY userGroup_approved (userGroup_approved),
  KEY userGroup_terms_option (userGroup_terms_option)
) TYPE=MyISAM;';



local:'dCoreSQLtable_dCoreModdb_core_categories' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_categories (
id int(11) auto_increment,
  category_name varchar(255) default \'\',
  category_menu_position int(11) default \'0\',
  category_level varchar(255) default \'0\',
  category_text mediumtext,
  category_dt_created varchar(255) default \'\',
  category_dt_modified varchar(255) default \'\',
  category_approved varchar(255) default \'0\',
  category_homepage varchar(11) default \'0\',
  category_template varchar(255) default \'0\',
  section_id varchar(255) default \'\',
  category_author varchar(255) default \'\',
  category_mode varchar(11) default \'0\',
  category_imgOne varchar(255) default \'\',
  category_imgTwo varchar(255) default \'\',
  category_imgThree varchar(255) default \'\',
  category_imgFour varchar(255) default \'\',
  category_imgFive varchar(255) default \'\',
  category_child varchar(11) default \'0\',
  PRIMARY KEY  (id),
  KEY category_approved (category_approved),
  KEY category_homepage (category_homepage),
  KEY category_child (category_child),
  KEY section_id (section_id),
  KEY category_template (category_template)
) TYPE=MyISAM;';



local:'dCoreSQLtable_dCoreModdb_core_fileCat' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_fileCat (
id int(11) auto_increment,
  fileCat_name varchar(255) default \'\',
  fileCat_types varchar(255) default \'\',
  fileCat_text text,
  fileCat_dt_created varchar(255) default \'\',
  fileCat_dt_modified varchar(255) default \'\',
  fileCat_approved varchar(11) default \'0\',
  user_id varchar(11) default \'0\',
  fileCat_access varchar(255) default \'\',
  PRIMARY KEY  (id),
  KEY fileCat_approved (fileCat_approved),
  KEY fileCat_types (fileCat_types),
  FULLTEXT fileCat_text (fileCat_text),
  KEY fileCat_access (fileCat_access),
  KEY user_id (user_id)
) TYPE=MyISAM;';



local:'dCoreSQLtable_dCoreModdb_core_users' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_users (
id int(11) auto_increment,
  user_master varchar(10) default \'\',
  userGroup_id varchar(10) default \'\',
  user_firstname varchar(75) default \'\',
  user_lastname varchar(75) default \'\',
  user_email_host varchar(75) default \'\',
  user_email_account varchar(75) default \'\',
  user_emailaddress varchar(150) default \'\',
  user_password varchar(50) default \'\',
  user_username varchar(50) default \'\',
  user_accNo varchar(50) default \'\',
  user_accType varchar(50) default \'\',
  user_accMax varchar(50) default \'\',
  user_dob varchar(50) default \'\',
  user_picture blob,
  user_dt_created varchar(15) default \'\',
  user_dt_modified varchar(15) default \'\',
  user_dt_lastLogin varchar(50) default \'\',
  user_streetNo varchar(100) default \'\',
  user_street varchar(100) default \'\',
  user_city varchar(75) default \'\',
  user_state varchar(75) default \'\',
  user_zip varchar(20) default \'\',
  user_country varchar(100) default \'\',
  user_telephone varchar(50) default \'\',
  user_fax varchar(50) default \'\',
  user_approved varchar(255) default \'0\',
  user_type varchar(20) default \'\',
  user_company varchar(100),
  user_pobox varchar(100),
  user_login varchar(100),
  user_author varchar(255),
  user_valid_account varchar(11) default \'0\',
  user_valid_string varchar(100) default \'\',
  user_secQuestionOne varchar(255),
  user_secQuestionTwo varchar(255),
  user_secQuestionThree varchar(255),
  user_secAnswerOne varchar(255),
  user_secAnswerTwo varchar(255),
  user_secAnswerThree varchar(255),
  PRIMARY KEY  (id),
  KEY userGroup_id (userGroup_id),
  KEY user_master (user_master),
  KEY user_login (user_login),
  KEY user_author (user_author),
  KEY user_country (user_country),
  KEY user_valid_string (user_valid_string),
  KEY user_valid_account (user_valid_account),
  KEY user_street (user_street),
  KEY user_streetno (user_streetno),
  KEY user_city (user_city),
  KEY user_state (user_state),
  KEY user_accType (user_accType),
  KEY user_company (user_company),
  KEY user_username (user_username),
  KEY user_accNo (user_accNo),
  KEY user_telephone (user_telephone),
  KEY user_emailaddress (user_emailaddress),
  KEY user_password (user_password),
  KEY user_approved (user_approved)
) TYPE=MyISAM;';



local:'dCoreSQLtable_dCoreModdb_core_files' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_files (
id int(11) auto_increment,
  file_title varchar(100) default \'\',
  file_name varchar(255) default \'\',
  file_type varchar(100) default \'\',
  fileCat_id varchar(100) default \'\',
  file_approved int(1) default \'0\',
  file_dt_created varchar(10) default \'\',
  file_dt_modified varchar(10) default \'\',
  file_access varchar(100) default \'\',
  file_hash varchar(255) default \'\',
  file_size varchar(15) default \'\',
  file_typeFull varchar(100) default \'\',
  file_text varchar(255) default \'\',
  user_id varchar(255) default \'\',
  file_author varchar(255) default \'\',
  PRIMARY KEY  (id),
  KEY file_name (file_name),
  KEY file_approved (file_approved),
  KEY file_type (file_type),
  KEY file_access (file_access),
  KEY file_hash (file_hash),
  KEY user_id (user_id),
  KEY file_author (file_author),
  KEY fileCat_id (fileCat_id)
) TYPE=MyISAM;';

local:'dCoreSQLtable_dCoreModdb_core_userPermissions' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_userPermissions (
id int(11) auto_increment,
  user_id varchar(10) default \'\',
  userGroup_id varchar(10) default \'\',
  section_id varchar(10) default \'\',
  category_id varchar(10) default \'\',
  content_id varchar(10) default \'\',
  file_id varchar(10) default \'\',
  fileCat_id varchar(10) default \'\',
  userPermission_read varchar(100) default \'0\',
  userPermission_write varchar(100) default \'0\',
  userPermission_edit varchar(100) default \'0\',
  userPermission_delete varchar(100) default \'0\',
  userPermission_upload varchar(100) default \'0\',
  userPermission_moderator varchar(100) default \'0\',
  PRIMARY KEY  (id),
  KEY user_id (user_id),
  KEY userGroup_id (userGroup_id),
  KEY userPermission_read (userPermission_read),
  KEY userPermission_write (userPermission_write),
  KEY userPermission_edit (userPermission_edit),
  KEY userPermission_delete (userPermission_delete),
  KEY userPermission_moderator (userPermission_moderator),
  KEY section_id (section_id),
  KEY file_id (file_id),
  KEY fileCat_id (fileCat_id),
  KEY category_id (category_id),
  KEY content_id (content_id)
) TYPE=MyISAM;';

local:'dCoreSQLtable_dCoreModdb_core_errors' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_errors (
id int(11) auto_increment,
  error_code varchar(100) default \'\',
  error_filepath varchar(255) default \'\',
  error_ip varchar(255) default \'\',
  error_browser varchar(255) default \'\',
  error_server varchar(255) default \'\',
  error_params text,
  error_status int(1) default \'0\',
  error_dt_created varchar(10) default \'\',
  error_dt_complete varchar(10) default \'\',
  error_fixBuild varchar(100) default \'\',
  error_build varchar(100) default \'\',
  error_fixAuthor varchar(255) default \'\',
  error_category varchar(15) default \'\',
  PRIMARY KEY  (id),
  KEY error_filepath (error_filepath),
  KEY error_code (error_code),
  KEY error_browser (error_browser),
  KEY error_ip (error_ip),
  KEY error_status (error_status),
  KEY error_dt_created (error_dt_created),
  KEY error_build (error_build),
  KEY error_category (error_category)
) TYPE=MyISAM;';

local:'dCoreSQLtable_dCoreModdb_core_statistics' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_statistics (
  id int(11) auto_increment,
  statistic_ip_address varchar(50),
  statistic_referrer varchar(255),
  statistic_response varchar(255),
  statistic_userID varchar(50),
  statistic_userGroup varchar(50),
  statistic_datestamp timestamp,
  statistic_session varchar(100),
  statistic_page varchar(10),
  statistic_browser text,
  statistic_type varchar(255),
  statistic_section varchar(100),
  statistic_area varchar(100),
  statistic_monthstamp varchar(10),
  PRIMARY KEY  (id),
  KEY statistic_ip_address (statistic_ip_address),
  KEY statistic_datestamp (statistic_datestamp),
  KEY statistic_session (statistic_session),
  KEY statistic_userGroup (statistic_userGroup),
  KEY statistic_userID (statistic_userID),
  KEY statistic_referrer (statistic_referrer),
  KEY statistic_page (statistic_page),
  KEY statistic_section (statistic_section),
  KEY statistic_area (statistic_area),
  KEY statistic_monthstamp (statistic_monthstamp)
) TYPE=MyISAM;';


local:'dCoreSQLtable_dCoreModdb_core_modules' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_modules (
id int(11) auto_increment,
  module_name varchar(255) default \'\',
  module_approved varchar(255) default \'0\',
  module_access varchar(255) default \'\',
  PRIMARY KEY  (id),
  KEY module_approved (module_approved),
  KEY module_access (module_access)
) TYPE=MyISAM;';

local:'dCoreSQLtable_dCoreModdb_core_links' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_links (
id int(11) auto_increment,
  link_url varchar(255) default \'\',
  content_id varchar(11) default \'0\',
  link_urlTitle varchar(255) default \'\',
  PRIMARY KEY  (id),
  KEY content_id (content_id)
) TYPE=MyISAM;';

local:'dCoreSQLtable_dCoreModdb_core_templates' = 'CREATE TABLE IF NOT EXISTS ' + (dCoreModTag_coreConfig->database) + '.dCoreModDB_core_templates (
id int(11) auto_increment,
  template_name varchar(255) default \'\',
  template_approved varchar(255) default \'0\',
  template_access varchar(255) default \'\',
  PRIMARY KEY  (id),
  KEY template_approved (template_approved),
  KEY template_access (template_access)
) TYPE=MyISAM;';
?>