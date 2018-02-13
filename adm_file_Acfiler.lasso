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



var:'fileCat_id' = (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'fcatnum'));
				// response page
	if: (file_uploads->size) > 0;
			inline: -username=(dCoreModTag_coreConfig->username),
				-password=(dCoreModTag_coreConfig->password);
				
				if: file_exists: (dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1')  + 'dCoreThumbs/' 	== false;  
					file_create: (dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/';
					file_create: ((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + 'index.lasso');
					file_write: ((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + 'index.lasso'), '[redirect_url:\'' + (dCoreModTag_core_appinfo->getURLPath:'1') + '\']';
				/if;
				//(file_uploads);abort;
				iterate: (file_uploads), (var:'fileGet');
					var: 'name' 		= (string_replace: -find=' ', -replace='_', (dCoreAPI_upload->getRealname: $fileGet));
					var: 'size' 		= (dCoreAPI_upload->getSize: $fileGet);
					
						if: (dCoreModTag_security->fileWrite:(((dcoreAPI_upload->getRealname:$fileGet)->split:'.')->(get:2))->(find: $sess_usergroup))->(size) == 0;
							if:(((var:'flFilenameConf') == '1') && ((var:'flFilename') != ''));
							
							
								var: 'flFilenameNew' 		= (string_replace: -find=' ', -replace='_',(var:'flFilename'));
								var:'flFilenameExt' = $name->(split:'.')->(get:2);
								
								if: $flFileNameNew >> '.';
									var:'flFileNameNewTitle' = $flFilenameNew->(split:'.')->(get:1);
								else;
									var:'flFileNameNewTitle' = $flFilenameNew;
								/if;	
								
								file_create: ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + ($flFileNameNewTitle + '.' + $flFilenameExt)) , -fileoverwrite;
								file_write: ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + ($flFileNameNewTitle + '.' + $flFilenameExt)), (file_read: (dCoreAPI_upload->getTemppath: $fileGet));
												
								var:'name' = $flFileNameNewTitle + '.' + $flFilenameExt;
							else;
								var: 'fileSave' 	= (dCoreAPI_upload->getPath: $fileGet, ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id')+ '/'));
							/if;
							
						
							var: 'typeFull' 	= (dCoreAPI_upload->getType: $fileGet);
							var: 'dt_created'	= dCoreAPI_dateTags->timestamp;
							var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
							var:'type' 		= (dCoreAPI_upload->getType: $fileGet)->(split:'/')->(get:1);
							if: (var:'type') == 'image';
								var:'hash' 		= (encrypt_md5:($name));
							
								var:'showImg' = image:((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + $fileCat_id + '/' + $name);
								
								
								if: ((var:'flImgDimConf') == '1');
									
									$showImg->(Scale: -Height=(var:'flImgDimHeight'), -width=(var:'flImgDimWidth'));
								
								/if;
								
								if: (var:'flImgOverlayConf') == '1';
						
									$showImg->(Annotate: (var:'flImgOverlayTxt'), -Left=5, -Top=15, -Font=((dCoreModTag_core_appinfo->getFontPath:'1') + (var:'flImgOverlayFont') + '.ttf'), -Size=(var:'flImgOverlaySize'), -Color=(var:'flImgOverlayColor'), -Aliased);
							
								/if;
								
								if: (var:'flImgContrastConfirm') == '1';
								
									if: $flImgContrast == 'true';
										$showImg->(Contrast);
									else: $flImgContrast == 'false';
										$showImg->(Contrast:'False');
									/if;
								
								/if;
								
								if: (var:'flImgContrastFiletype') == '1';
								
									if: $flImgContrast == 'true';
										$showImg->(Contrast);
									else: $flImgContrast == 'false';
										$showImg->(Contrast:'False');
									/if;
								
								/if;
								
								$showImg->(Save: ((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + $fileCat_id + '/' + $name),-fileoverwrite);
								
								var:'showImgThumb' = image:((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + $fileCat_id + '/' + $name);
								
								if:((var:'flFileThumType') == 'fixed');
									$showImgThumb->(Scale: -Height=(var:'flImgThumHeight'), -width=(var:'flImgThumWidth'),-Thumbnail);
								else:((var:'flFileThumType') == 'scale');
									var:'showImgPercent' = ((var:'flImgThumScale') + '%');
									$showImgThumb->(Scale: -width=$showImgPercent,-Thumbnail);
								else;
									$showImgThumb->(Scale: -width='20%',-Thumbnail);
								/if;
								
								$showImgThumb->(Save: ((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + $hash),-fileoverwrite);
							else;
								var:'hash' = ($name);
							/if;
						else;
								var:'permsError' = '&nbsp;<b>File Extension is not permitted for your User Group!</b>';
						/if;
				
				
						if: 	(var:'permsError') == '';
				
							if: (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'file_name'=(var:'name')))),(dCoreModTag_core_files->setFields)->second))->get:2 == 0;
													
								local: 'dCoreInsertFields' = dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(dCoreModTag_core_files->setLocal));
								
								if: (error_currenterror: -errorcode) == 0;
							
									var:'file_id' = #dCoreInsertFields->get:2;
									
								/if;
							else;
									
									dCoreModAPI_errors->Duplicate;
								
							/if;	
						else;

							$permsError;
							include:(lassoapp_link:'adm_file_Acfile.lasso');
					
						/if;
				/iterate;
		/inline;		
		
		local:'dCorefiles' 		= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'id'=$file_id))),(dCoreModTag_core_files->setFields)->second));
			
		var:'filenum' = (Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), $file_id);
			
		include:(lassoapp_link:'adm_file_view_layout.lasso');
				
else;

	include:(lassoapp_link:'adm_file_Acfile.lasso');
	
/if;
?>