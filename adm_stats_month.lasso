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


dCoreModTag_hd746Purple:'Statistics Administration',-encodenone;


local:'windowsOS'	= 0;
local:'macOS'		= 0;
local:'linuxOS'		= 0;
local:'otherOS'		= 0;

local:'ipCheck'	=	0;

local:'MOZILLA5'			= 0;
local:'MOZILLA4'			= 0;

local:'statsOSsearch' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_statistics',(array: (pair:'='=(pair:'statistic_monthstamp'=(dCoreAPI_dateTags->monthstamp)))),(dCoreModTag_core_statistics->setFields)->second,(pair:'statistic_ip_address'='DESC')));




//'<table border="0" width="100%">';
/*
'<tr>';
'<td><b>IP Address</b></td>';
'<td><b>Date/Time</b></td>';
'<td colspan="6"><b>Referrer</b></td>';
'</tr>';
'<tr>';
'<td><b>User</b></td>';
'<td><b>UserGroup</b></td>';
'<td><b>Session</b></td>';
'<td><b>Type</b></td>';
'<td><b>Area</b></td>';
'<td><b>Month</b></td>';
'<td><b>Page</b></td>';
'<td><b>Section</b></td>';

'</tr>';
*/
//'<tr><td colspan="8">&nbsp;</td></tr>';
iterate: #statsOSsearch->get:3, local:'statsOSsearchRecord';
	if: #statsOSsearchRecord->get:6 != local:'ipCheckAddress';
		#ipCheck += 1;
		local:'ipCheckAddress' = #statsOSsearchRecord->get:6;
	/if;
	
/*
	
	'<tr>';
	'<td>' + #statsOSsearchRecord->get:6 + '</td>';
	'<td>' + #statsOSsearchRecord->get:7 + '</td>';
	'<td colspan="6"><a href="' + (#statsOSsearchRecord->get:2) + '">' + (#statsOSsearchRecord->get:3) + '</a></td>';
	'</tr>';
	'<tr>';
	'<td>' + #statsOSsearchRecord->get:4 + '</td>';
	'<td>' + #statsOSsearchRecord->get:5 + '</td>';
	'<td>' + #statsOSsearchRecord->get:8 + '</td>';
	'<td>' + #statsOSsearchRecord->get:10 + '</td>';
	
	'<td>' + #statsOSsearchRecord->get:13 + '</td>';
	'<td>' + #statsOSsearchRecord->get:14 + '</td>';
	'<td>' + #statsOSsearchRecord->get:9 + '</td>';
	'<td>' + #statsOSsearchRecord->get:12 + '</td>';
	'</tr>';
	'<tr><td colspan="8">&nbsp;</td></tr>';
	'<tr><td colspan="8">&nbsp;</td></tr>';
	
*/	



	if: (#statsOSsearchRecord->get:10) >> 'windows';
		#windowsOS += 1;
	else: (#statsOSsearchRecord->get:10) >> 'mac';
		#macOS += 1;
	else: (#statsOSsearchRecord->get:10) >> 'linux';
		#linuxOS += 1;
	else;
		#otherOS += 1;
	/if;
	
	
	
	if: (#statsOSsearchRecord->get:10) >> 'Mozilla/4';
		#MOZILLA4 += 1;
	else: (#statsOSsearchRecord->get:10) >> 'Mozilla/5';
		#MOZILLA5 += 1;
	/if;
	
	
	
/iterate;
//'</table>';
'<table border="0" width="100%">';
'<tr>';
'<td valign="top">';

var: 'daysInMonth' = (Array:
				31,
				28,
				31,
				30,
				31,
				30,
				31,
				31,
				30,
				31,
				30,
				31);

dCoreModTag_hd746Grey:'Month',-encodenone;

local:'getMonth' = (dCoreAPI_dateTags->monthstamp) + '01';
(date: #getMonth, -format='%Y%m%d');


'<table border="0" width="746">';

local: 'getMonthHits' 	= 0;
local:'getMonthStart' 	= (date_format:#getMonth,-format='%m/%d/%y');

local:'getDateMonth' 	= (date_format: (#getMonthStart),-format='%m/%d/%y');

local:'getMonthStartDay' = (date: (#getDateMonth + ' 00:00'), -format='%m/%d/%y %H:%M');
local:'getMonthEndHour' = (date: (#getDateDay + ' 23:54'), -format='%m/%d/%y %H:%M');
(#getDateEndHour->Add: -Hour=1);
loop: 24;
	(#getDateStartHour->Add: -Hour=1);
	(#getDateEndHour->Add: -Hour=1);
	
	
	local:'statsHoursearch' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_statistics',(array: (pair:'>'=(pair:'statistic_datestamp'=(date_format:#getDateStartHour,-format='%q'))),(pair:'<'=(pair:'statistic_datestamp'=(date_format:#getDateEndHour,-format='%q')))),(dCoreModTag_core_statistics->setFields)->second,(pair:'statistic_datestamp'='DESC')));
	local: 'HourStat_' + (loop_count) = (#statsHoursearch->get:2);
	#getDayHits += (local: 'HourStat_' + (loop_count));
	
/loop;


'<tr>';
'<td><b>Date/Time</b></td>';
'<td align="center"><b>Hits</b></td>';
'<td colspan="2"><b>Day Percentage</b></td>';
'</tr>';
local:'getDateStart' = (date_format:#getDate,-format='%m/%d/%y');

local:'getDateDay' = (date_format: (#getDateStart),-format='%m/%d/%y');

local:'getDateStartHour' = (date: (#getDateDay + ' 23:00'), -format='%m/%d/%y %H:%M');
local:'getDateEndHour' = (date: (#getDateDay + ' 23:00'), -format='%m/%d/%y %H:%M');
(#getDateEndHour->Add: -Hour=1);

loop: 24;
	(#getDateStartHour->Add: -Hour=1);
	(#getDateEndHour->Add: -Hour=1);
	
	
	'<tr>';
	'<td nowrap height="15" width="90">' + (date_format:#getDateStartHour,-format='%m/%d %H:%M') + '</td>';
	'<td align="center" nowrap height="15" width="75">' + (local:'HourStat_' + (loop_count)) + '</td>';
	
	if: (dCoreAPI_PercentOf: -int1=(local:'HourStat_' + (loop_count)),-int2=(#getDayHits)) > 0;
		'<td align="left" nowrap valign="middle" bgcolor="#ffffff" width="100%"><img src="dCoreIMG_core/graphstart.gif" border="0" height="15"><img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(local:'HourStat_' + (loop_count)),-int2=(#getDayHits)) + '%"></td>';
		'<td align="left" valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2" width="151">';
	/if;
	(dCoreAPI_PercentOf: -int1=(local:'HourStat_' + (loop_count)),-int2=(#getDayHits));
	'%</td>';
	
	
	'</tr>';
/loop;


'</table>';

'</td>';
'<td valign="top">';
dCoreModTag_hd241Grey:'Operating Systems',-encodenone;
'<table border="0" width="241">';
'<tr><td width="30"><img src="dCoreIMG_core/icon_win.gif" border="0" alt="Windows OS"></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#windowsOS),-int2=(#statsOSsearch->get:2)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#windowsOS),-int2=(#statsOSsearch->get:2)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#windowsOS),-int2=(#statsOSsearch->get:2)) + '%">';
		//'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">&nbsp;';
	/if;
	(dCoreAPI_PercentOf: -int1=(#windowsOS),-int2=(#statsOSsearch->get:2));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';
'<tr><td width="30"><img src="dCoreIMG_core/icon_mac.gif" border="0" alt="Macintosh OS"></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#macOS),-int2=(#statsOSsearch->get:2)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#macOS),-int2=(#statsOSsearch->get:2)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#macOS),-int2=(#statsOSsearch->get:2)) + '%">';
		//'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#macOS),-int2=(#statsOSsearch->get:2));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'<tr><td width="30"><img src="dCoreIMG_core/icon_linux.gif" border="0" alt="Linux OS"></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#linuxOS),-int2=(#statsOSsearch->get:2)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#linuxOS),-int2=(#statsOSsearch->get:2)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#linuxOS),-int2=(#statsOSsearch->get:2)) + '%">';
		//'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#linuxOS),-int2=(#statsOSsearch->get:2));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'<tr><td width="30"><img src="dCoreIMG_core/icon_other.gif" border="0" alt="Unknown OS"></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#otherOS),-int2=(#statsOSsearch->get:2)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#otherOS),-int2=(#statsOSsearch->get:2)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#otherOS),-int2=(#statsOSsearch->get:2)) + '%">';
		//'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#otherOS),-int2=(#statsOSsearch->get:2));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'</table>';



dCoreModTag_hd241Grey:'Mozilla Compatibility',-encodenone;
'<table border="0" width="241">';

'<tr><td width="30">v4</td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#Mozilla4),-int2=(#statsOSsearch->get:2)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#Mozilla4),-int2=(#statsOSsearch->get:2)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#Mozilla4),-int2=(#statsOSsearch->get:2)) + '%">';
		//'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#Mozilla4),-int2=(#statsOSsearch->get:2));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'<tr><td width="30">v5</td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#Mozilla5),-int2=(#statsOSsearch->get:2)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#Mozilla5),-int2=(#statsOSsearch->get:2)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#Mozilla5),-int2=(#statsOSsearch->get:2)) + '%">';
		//'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#Mozilla5),-int2=(#statsOSsearch->get:2));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';
'</table>';	
	
'&nbsp;';

dCoreModTag_hd241Grey:'Statistical Data',-encodenone;
'<table border="0" width="241">';

'<tr><td width="90">Views:</td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#Mozilla4),-int2=(#statsOSsearch->get:2)) + '%">';
		'<b>';#statsOSsearch->get:2;'</b>';
		'</td>';
		
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'<tr><td width="90">Uniques:</td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#Mozilla4),-int2=(#statsOSsearch->get:2)) + '%">';
		'<b>';#IPCheck;'</b>';
		'</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';
'</table>';

?>

