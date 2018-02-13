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




// response page
var:'file_id' 		= 	(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'filenum'));

local:'dCorefiles' 	= 	(dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'id'=$file_id))),(dCoreModTag_core_files->setFields)->second));
	
var:'fileCat_id' 	= 	(#dCoreFiles->get:3->get:1->get:6);
				// response page
	if: (file_uploads->size) > 0;
		inline: -username=(dCoreModTag_coreConfig->username),
			-password=(dCoreModTag_coreConfig->password);
			iterate: (file_uploads), (var:'fileGet');
					var: 'name' 		= (string_replace: -find=' ', -replace='_', (dCoreAPI_upload->getRealname: $fileGet));
					var: 'size' 		= (dCoreAPI_upload->getSize: $fileGet);
					
				if: dCoreModTag_security->fileWrite:(($name->split:'.')->(get:2))->(find: $sess_usergroup)->(size) == 0;
					var: 'fileSave' 	= (dCoreAPI_upload->getPath: $fileGet, ((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id')+ '/'));
					if:(((var:'flFilenameConf') == '1') && ((var:'flFilename') != ''));
						var: 'flFilenameNew' 		= (string_replace: -find=' ', -replace='_',(var:'flFilename'));
						var:'flFilenameExt' = $name->(split:'.')->(get:2);
						if: $flFileNameNew >> '.';
							var:'flFileNameNewTitle' = $flFilenameNew->(split:'.')->(get:1);
						else;
							var:'flFileNameNewTitle' = $flFilenameNew;
						/if;	
						(File_Rename:
						((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + $name),
						((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + ($flFileNameNewTitle + '.' + $flFilenameExt)),
						-fileoverwrite);
						
						var:'name' = $flFileNameNewTitle + '.' + $flFilenameExt;
					/if;
					var: 'typeFull' 	= (dCoreAPI_upload->getType: $fileGet);
					var: 'dt_created'	= dCoreAPI_dateTags->timestamp;
					var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
					var:'type' 		= (dCoreAPI_upload->getType: $fileGet)->(split:'/')->(get:1);
					if: (var:'type') == 'image';
						var:'hash' 		= (encrypt_md5:($name));
					
						var:'showImg' = image:((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + $fileCat_id + '/' + $name);
						
						
						if:((var:'flImgDimConf') == '1');
							
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
						var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
		
				/iterate;
		/inline;
		
	else: (#dCoreFiles->get:3->get:1->get:9 >> 'image');
	inline: 
			-Username=(dCoreModTag_coreConfig->username), 
			-Password=(dCoreModTag_coreConfig->password);
			
		local: 'showImg' = (image:(dCoreModTag_core_appinfo->getFilePath:'1') + (#dCoreFiles->get:3->get:1->get:6) + '/' + (#dCoreFiles->get:3->get:1->get:2));
		var: 'name' 		= (#dCoreFiles->get:3->get:1->get:2);
		var: 'size' 		= (#dCoreFiles->get:3->get:1->get:12);
		var: 'typefull' 	= (#dCoreFiles->get:3->get:1->get:13);
		var: 'type' 		= (#dCoreFiles->get:3->get:1->get:9);
		
		if:(((var:'flFilenameConf') == '1') && ((var:'flFilename') != ''));
			var: 'flFilenameNew' 		= (string_replace: -find=' ', -replace='_',(var:'flFilename'));
			var:'flFilenameExt' = (#dCoreFiles->get:3->get:1->get:2)->(split:'.')->(get:2);
			if: $flFileNameNew >> '.';
				var:'flFileNameNewTitle' = $flFilenameNew->(split:'.')->(get:1);
			else;
				var:'flFileNameNewTitle' = $flFilenameNew;
			/if;	
			
			(File_create:((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + ($flFileNameNewTitle + '.' + $flFilenameExt)),-fileoverwrite);
			(File_write:(
				(dCoreModTag_core_appinfo->getRootPath:'1')  + 
				(dCoreModTag_core_appinfo->getFilePath:'1') + 
				(var:'fileCat_id') + 
				'/' + 
				($flFileNameNewTitle + '.' + $flFilenameExt)
				),
				(File_read:
				(dCoreModTag_core_appinfo->getRootPath:'1')  + 
				(dCoreModTag_core_appinfo->getFilePath:'1') + 
				(var:'fileCat_id') + 
				'/' + 
				(#dCoreFiles->get:3->get:1->get:2)
				));
				if: (file_currenterror) == 0;
					(File_delete:
					(dCoreModTag_core_appinfo->getRootPath:'1')  + 
					(dCoreModTag_core_appinfo->getFilePath:'1') + 
					(var:'fileCat_id') + 
					'/' + 
					(#dCoreFiles->get:3->get:1->get:2)
					);
				/if;
			var:'name' = $flFileNameNewTitle + '.' + $flFilenameExt;
		/if;
		if:((var:'flImgDimConf') == '1');
							
			$showImg->(Scale: -Height=(var:'flImgDimHeight'), -width=(var:'flImgDimWidth'));
		
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
		
		if: (var:'flImgOverlayConf') == '1';
				
			$showImg->(Annotate: (var:'flImgOverlayTxt'), -Left=5, -Top=15, -Font=((dCoreModTag_core_appinfo->getFontPath:'1') + (var:'flImgOverlayFont') + '.ttf'), -Size=(var:'flImgOverlaySize'), -Color=(var:'flImgOverlayColor'), -Aliased);
			
		/if;			
		var:'hash' 		= (encrypt_md5:($name));
		
		$showImg->(Save: ((dCoreModTag_core_appinfo->getFilePath:'1') + $fileCat_id + '/' + $name),-fileoverwrite);
		var:'showImgThumb' = image:((dCoreModTag_core_appinfo->getFilePath:'1') + $fileCat_id + '/' + $name);
		if:((var:'flFileThumType') == 'fixed');
			$showImgThumb->(Scale: -Height=(var:'flImgThumHeight'), -width=(var:'flImgThumWidth'),-Thumbnail);
		else:((var:'flFileThumType') == 'scale');
			var:'showImgPercent' = ((var:'flImgThumScale') + '%');
			$showImgThumb->(Scale: -width=$showImgPercent,-Thumbnail);
		else:((var:'flFileThumType') != 'ignore');
			$showImgThumb->(Scale: -width='20%',-Thumbnail);
			
		/if;
		if:((var:'flFileThumType') != 'ignore');
		
			$showImgThumb->(Save: ((dCoreModTag_core_appinfo->getRootPath:'1') + (dCoreModTag_core_appinfo->getFilePath:'1') + 'dCoreThumbs/' + $hash),-fileoverwrite);				
			
		/if;
		var: 'dt_created' 	= (#dCoreFiles->get:3->get:1->get:10);	
		var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
		
		/inline;
			
	else;	
	inline: 
			-Username=(dCoreModTag_coreConfig->username), 
			-Password=(dCoreModTag_coreConfig->password);
	
	
		var: 'hash' 		= (#dCoreFiles->get:3->get:1->get:5);
		var: 'size' 		= (#dCoreFiles->get:3->get:1->get:12);
		var: 'typefull' 	= (#dCoreFiles->get:3->get:1->get:13);
		var: 'type' 		= (#dCoreFiles->get:3->get:1->get:9);
		var: 'name' 		= (#dCoreFiles->get:3->get:1->get:2);	
		var: 'dt_created' 	= (#dCoreFiles->get:3->get:1->get:10);	
		var: 'dt_modified'	= dCoreAPI_dateTags->timestamp;
		
		if:(((var:'flFilenameConf') == '1') && ((var:'flFilename') != ''));
			var: 'flFilenameNew' 		= (string_replace: -find=' ', -replace='_',(var:'flFilename'));
			var:'flFilenameExt' = (#dCoreFiles->get:3->get:1->get:2)->(split:'.')->(get:2);
			if: $flFileNameNew >> '.';
				var:'flFileNameNewTitle' = $flFilenameNew->(split:'.')->(get:1);
			else;
				var:'flFileNameNewTitle' = $flFilenameNew;
			/if;	
			
			(File_create:((dCoreModTag_core_appinfo->getRootPath:'1')  + (dCoreModTag_core_appinfo->getFilePath:'1') + (var:'fileCat_id') + '/' + ($flFileNameNewTitle + '.' + $flFilenameExt)),-fileoverwrite);
			(File_write:(
				(dCoreModTag_core_appinfo->getRootPath:'1')  + 
				(dCoreModTag_core_appinfo->getFilePath:'1') + 
				(var:'fileCat_id') + 
				'/' + 
				($flFileNameNewTitle + '.' + $flFilenameExt)
				),
				(File_read:
				(dCoreModTag_core_appinfo->getRootPath:'1')  + 
				(dCoreModTag_core_appinfo->getFilePath:'1') + 
				(var:'fileCat_id') + 
				'/' + 
				(#dCoreFiles->get:3->get:1->get:2)
				));
				if: (file_currenterror) == 0;
					(File_delete:
					(dCoreModTag_core_appinfo->getRootPath:'1')  + 
					(dCoreModTag_core_appinfo->getFilePath:'1') + 
					(var:'fileCat_id') + 
					'/' + 
					(#dCoreFiles->get:3->get:1->get:2)
					);
				/if;
			
			
			var:'name' = $flFileNameNewTitle + '.' + $flFilenameExt;
		/if;
		/inline;
			
	/if;
	if: 	(var:'permsError') == '';
		
		local: 'dCoreUpdateFields' 	= (dCoreModTag_moduleDb->(Update: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(dCoreModTag_core_files->setLocal),(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'filenum')))))));
			
		local: 'dCoreFiles' 		= (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_files',(array: (pair:'='=(pair:'id'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), (var:'filenum'))))),(dCoreModTag_core_files->setFields)->second));
		
	else;

		$permsError;
		
	/if;	
		include:(lassoapp_link:'adm_file_view_layout.lasso');

?>