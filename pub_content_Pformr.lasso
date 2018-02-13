
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

		var: 'dCoreAPI_form_formParams'	= (array);
		if: (var: 'dCoreAPI_formForm_params') == '1';
			Search_Arguments;
				if: (Search_FieldItem)->(beginswith: 'dCorefp_') == true;
					$dCoreAPI_form_formParams->(insert: (pair: (Search_FieldItem) = (Search_ValueItem)));
				/if;
			/Search_Arguments;
		/if;
		
		var:'dCoreAPI_form_formBody' = 'The form was completed with the following values:';
		loop: $dCoreAPI_form_formParams->Size;
			var:'dCoreAPI_form_formParamItem' = ($dCoreAPI_form_formParams->(get:(loop_count)));
			var:'dCoreAPI_form_formParamItemFirst' = ($dCoreAPI_form_formParamItem->(first));
			var:'dCoreAPI_form_formParamItemSecond' = ($dCoreAPI_form_formParamItem->(second));
			$dCoreAPI_form_formBody += '\n\n' + (string_uppercase:$dCoreAPI_form_formParamItemFirst) + '  =  ' + $dCoreAPI_form_formParamItemSecond;
		/loop;
			Email_Send: 	-Host=(dCoreModTag_core_appinfo->emailserver:'1'),
					-To=(var:'dCoreAPI_formForm_from'),
	                                -To=(var:'dCoreAPI_formForm_to'),
	                                -CC=(var:'dCoreAPI_formForm_cc'),
	                                -Subject=(var:'dCoreAPI_formForm_subject'),
	                                -body=$dCoreAPI_form_formBody;
	                              
			'<P>';
			if: var:'dCoreAPI_formForm_response' == 'html';
				var:'dCoreAPI_formForm_response',-encodenone;
			else;
				var:'dCoreAPI_formForm_response';
			/if;
			'</P>';
			
	?>
			
		