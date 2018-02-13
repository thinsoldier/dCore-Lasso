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

inline: -username=(dCoreModTag_coreConfig->username),
	-password=(dCoreModTag_coreConfig->password);
	
	iterate: (File_ListDirectory: (response_path)),local:'getItem';
	
		if: ((#getItem->contains:'App_') == true) && ((#getItem->contains:'.LassoApp') == true) && #getItem != ((response_filePath)->(split:'/')->(get:(response_filePath)->(split:'/')->size));
			dCoreModTag_hd241Grey:('<a href="' + #getItem + '" class="body"><font color="white">' + (string_replace:-find=(dCoreModTag_coreConfig->prefix) + 'App_',-replace='',(string_uppercase:((#getItem)->(split:'.')->get:1))) + '</font></a>');
			
		/if;
	/iterate;
		
/inline;	
?>