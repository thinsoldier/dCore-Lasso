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


var:'statsArray' = (array: 	(pair: 'statistic_referrer'=(referrer_url)),
				(pair: 'statistic_response'=(response_filepath)),
				(pair: 'statistic_userID'=(var:'sess_userID')),
				(pair: 'statistic_userGroup'=(var:'sess_userGroup')),
				(pair: 'statistic_type'=(client_type)),
				(pair: 'statistic_ip_address'=(client_ip)),
				(pair: 'statistic_datestamp'=(dCoreAPI_dateTags->mysqlstamp)),
				(pair: 'statistic_session'=(session_id: -Name=(dCoreModTag_core_appinfo->getSession:'1'))),
				(pair: 'statistic_page'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'conNum'))),
				(pair: 'statistic_browser'=(client_browser)),
				(pair: 'statistic_section'=(Decrypt_BlowFish: -seed=(dCoreModTag_core_appinfo->getCrypto:'1'),(var:'sectNum'))),
				(pair: 'statistic_area'=(var:'adminArea')),
				(pair: 'statistic_monthstamp'=(dCoreAPI_dateTags->monthstamp)));
	
// 641 to here		

			// insert the stats into the stats table
							
			local: 'dCoreInsertStats'  =  dCoreModTag_moduleDb->(Insert: (dCoreModTag_coreConfig->database),'dCoreModdb_core_statistics',($statsArray));

?>