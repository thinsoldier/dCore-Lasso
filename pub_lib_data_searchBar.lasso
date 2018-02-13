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


inline: -database=(dCoreModTag_coreConfig->database), -username=(dCoreModTag_coreConfig->username), -password=(dCoreModTag_coreConfig->password);


		
		var:'dCorePub_libSearchBarTmpl'	=	'';
		$dCorePub_libSearchBarTmpl	+=	'<table border="0"  width="100%" cellpadding="0" cellspacing="0"  class="' + (dCoreModTag_tmplClass->masterSearch) +'">';

		$dCorePub_libSearchBarTmpl	+=	'<tr height="2"><td colspan="2"   height="2"  ><font size="1"><img src="dCoreIMG_core/xx.gif"></font></td></tr>';
		$dCorePub_libSearchBarTmpl	+=	'<tr>';
		$dCorePub_libSearchBarTmpl	+=	'<td width="50%"   class="' + (dCoreModTag_tmplClass->masterSearch) +'">&nbsp;'+ dCoreAPI_dateTags->todaydatecomplete + '</td>';
		
		$dCorePub_libSearchBarTmpl	+=	'<form action="'+(lassoapp_link:'index.lasso')+'?pg='+(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'), 'Psearchr')+'" method="post">';
		$dCorePub_libSearchBarTmpl	+=	'<td width="50%"  align="right"  class="' + (dCoreModTag_tmplClass->masterSearch) +'">';
		$dCorePub_libSearchBarTmpl	+=	'&nbsp;';
		$dCorePub_libSearchBarTmpl	+=	'&nbsp;';
		$dCorePub_libSearchBarTmpl	+=	'<select name="keyword_section">';
		$dCorePub_libSearchBarTmpl	+=	'<option value="';
		$dCorePub_libSearchBarTmpl	+=	(Encrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),'0');
		$dCorePub_libSearchBarTmpl	+=	'">Site';
		iterate: (#dCoreModAPI_Tmpl_output_sectTitle), local:'searchSectionsItem';
		
		$dCorePub_libSearchBarTmpl	+=	'<option value="';
		$dCorePub_libSearchBarTmpl	+=	(#searchSectionsItem->get:1);
		$dCorePub_libSearchBarTmpl	+=	'"';
			if: (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'keyword_section')) == (Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(#searchSectionsItem->get:1));
		$dCorePub_libSearchBarTmpl	+=			' selected';
			/if;
		$dCorePub_libSearchBarTmpl	+=	'>';
		$dCorePub_libSearchBarTmpl	+=	(#searchSectionsItem->get:2->get:1);
		/iterate;
		$dCorePub_libSearchBarTmpl	+=	'</select>';
		$dCorePub_libSearchBarTmpl	+=	'<input type="text" size="15" name="keyword" value="' + (var:'keyword') + '">';
		$dCorePub_libSearchBarTmpl	+=	'<input type="submit" value="Search">';
		$dCorePub_libSearchBarTmpl	+=	'</td>';
		$dCorePub_libSearchBarTmpl	+=	'</form>';
		
		$dCorePub_libSearchBarTmpl	+=	'</tr>';
		$dCorePub_libSearchBarTmpl	+=	'<tr height="2"><td colspan="2" ><font size="1"><img src="dCoreIMG_core/xx.gif"></font></td></tr>';
		$dCorePub_libSearchBarTmpl	+=	'</table>';


/inline;		
?>