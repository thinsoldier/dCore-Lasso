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
'<style>';
'TD {color:#000000;font-size:10pt;font-family:arial, Geneva, Arial, Helvetica, san-serif;}';
'</style>';

local:'windowsOS'	= 0;
local:'macOS'		= 0;
local:'linuxOS'		= 0;
local:'otherOS'		= 0;

local:'statsOSsearch' = (dCoreModTag_moduleDb->(search: (dCoreModTag_coreConfig->database),'dCoreModdb_core_statistics',(array: (pair:'='=(pair:'statistic_monthstamp'=(dCoreAPI_dateTags->monthstamp)))),(dCoreModTag_core_statistics->setFields)->second,(pair:'statistic_datestamp'='DESC')));




'<table border="0" width="100%">';
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
'<tr><td colspan="8">&nbsp;</td></tr>';
iterate: #statsOSsearch->get:3, local:'statsOSsearchRecord';
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
/iterate;
'</table>';
dCoreModTag_hd746Purple:'Operating Systems',-encodenone;
'<table border="0" width="746">';
'<tr><td width="120"><b>Windows OS</b></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#windowsOS)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#windowsOS)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#windowsOS)) + '%">';
		'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">&nbsp;';
	/if;
	(dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#windowsOS));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';
'<tr><td width="120"><b>Macintosh OS</b></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#macOS)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#macOS)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#macOS)) + '%">';
		'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#macOS));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'<tr><td width="120"><b>Linux OS</b></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#linuxOS)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#linuxOS)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#linuxOS)) + '%">';
		'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#linuxOS));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'<tr><td width="120"><b>Other OS</b></td>';
'<td>';
	'<table border="0" width="100%">';
	'<tr>';
	if: (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#otherOS)) > 0;
		'<td nowrap valign="middle" bgcolor="#ffffff" width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#otherOS)) + '%">';
		'<img src="dCoreIMG_core/graphstart.gif" border="0" height="15">';
		'<img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#otherOS)) + '%">';
		'<img src="dCoreIMG_core/graphend.gif" border="0" height="15">';
		'</td>';
		'<td valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2">';
	/if;
	(dCoreAPI_PercentOf: -int1=(#statsOSsearch->get:2),-int2=(#otherOS));
	'%</td>';
	'</tr>';
	'</table>';
'</td>';
'</tr>';

'</table>';



dCoreModTag_hd746Purple:'24 Hours',-encodenone;

local:'getDate' = (Date_getCurrentDate);

(#getDate->Subtract: -day=1);


'<table border="0" width="746">';

local: 'getDayHits' 	= 0;
local:'getDateStart' 	= (date_format:#getDate,-format='%m/%d/%y');

local:'getDateDay' 	= (date_format: (#getDateStart),-format='%m/%d/%y');

local:'getDateStartHour' = (date: (#getDateDay + ' 23:00'), -format='%m/%d/%y %H:%M');
local:'getDateEndHour' = (date: (#getDateDay + ' 23:00'), -format='%m/%d/%y %H:%M');
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
	'<td nowrap height="15" width="120">' + (date_format:#getDateStartHour,-format='%m/%d %H:%M') + '</td>';
	'<td align="center" nowrap height="15" width="75">' + (local:'HourStat_' + (loop_count)) + '</td>';
	
	if: (dCoreAPI_PercentOf: -int1=(local:'HourStat_' + (loop_count)),-int2=(#getDayHits)) > 0;
		'<td align="left" nowrap valign="middle" bgcolor="#ffffff" width="100%"><img src="dCoreIMG_core/graphstart.gif" border="0" height="15"><img src="dCoreIMG_core/graphmiddle.gif" border="0" height="15" ' + 'width="' + (dCoreAPI_PercentOf: -int1=(local:'HourStat_' + (loop_count)),-int2=(#getDayHits)) + '%"></td>';
		'<td align="left" valign="middle" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	else;
		'<td colspan="2" width="616">';
	/if;
	(dCoreAPI_PercentOf: -int1=(local:'HourStat_' + (loop_count)),-int2=(#getDayHits));
	'%</td>';
	
	
	'</tr>';
/loop;


'</table>';




	
?>

