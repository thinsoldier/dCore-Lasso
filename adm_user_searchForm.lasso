<?lassoscript
/*#######################################################################
#									#
#		Application: 	dCore					#
#		Version: 	1b					#
#		Author: 	Duncan Cameron				#
#									#
#		File:							#
#		File Purpose:						#
#		Area:		Admin/Moderator				#
#									#
#		Date: July 2004						#
#									#
#									#
#									#
#########################################################################
#									#
#	-----  DO *NOT* AMEND SOURCE BELOW  -----			#
#									#
#######################################################################*/





	dCoreModTag_hd241Grey:'Search Accounts',-encodenone;
		'<table border="0" bgcolor="black" cellpadding="2" cellspacing="1" width="241">';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>First Name:</b></td>';
				'<td bgcolor="white"><input type="text" name="firstname" value="'+(var:'firstname')+'"></td>';
			'</tr>';
			
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Last Name:</b></td>';
				'<td bgcolor="white"><input type="text" name="lastname" value="'+(var:'lastname')+'"></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Telephone:</b></td>';
				'<td bgcolor="white"><input type="text" name="telephone" value="'+(var:'telephone')+'"></td>';
			'</tr>';
			
			if: (var:'ugnum') == '';
				'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>UserGroup:</b></td>';
					
						'<td bgcolor="white" align="left">';
						
						
						'<select name="userGroup">';
						iterate: (dCoreModTag_core_userGroups->getapproved), local:'getGroup';
						 '<option value="' + (#getGroup->get:1)  + '"';
						 if: (var:'userGroup') == (#getGroup->get:1);
						 ' selected';
						 /if;
						 '>' + (#getGroup->get:2);
						 /iterate;
						 '</select>';
						 
						 '</td>';
				
				'</tr>';	
			/if;	
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Account Number:</b></td>';
				'<td bgcolor="white"><input type="text" name="accNo" value="'+(var:'accNo')+'"></td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white">&nbsp;&nbsp;<b>Display:</b></td>';
				'<td bgcolor="white">';
				'<select name="max">';
				'<option value="5"';
				if: (var:'max') == '5';
				' selected';
				/if;
				'>5 Records';
				'<option value="10"';
				if: (var:'max') == '10';
				' selected';
				/if;
				'>10 Records';
				'<option value="25"';
				if: (var:'max') == '25';
				' selected';
				/if;
				'>25 Records';
				'<option value="50"';
				if: (var:'max') == '50';
				' selected';
				/if;
				'>50 Records';
				
				'<option value="100"';
				if: (var:'max') == '100';
				' selected';
				/if;
				'>100 Records';
				'</select>';
				'</td>';
			'</tr>';
			
			'<tr valign="top">';
				'<td bgcolor="white">';
				'&nbsp;&nbsp;<b>Type Match:</b>';
				'</td>';
				'<td bgcolor="white" colspan="2">';
				'<select name="stype">';
				'<option value="bw"';
				if: (var:'stype') == 'bw';
					' selected';
				/if;
				'>Begins With';
				'<option value="ew"';
				if: (var:'stype') == 'ew';
					' selected';
				/if;
				'>Ends With';
				
				'<option value="any"';
				if: (var:'stype') == 'any';
					' selected';
				/if;
				'>Any Word';
				'<option value="eq"';
				if: (var:'stype') == 'eq';
					' selected';
				/if;
				
				'>All Words';
				'</select>';
				'</td>';
			'</tr>';
			if: (var_defined:'htype') == true;($htype->trim);/if;
			'<tr valign="top">';
				'<td bgcolor="white">';
				'&nbsp;&nbsp;<b>Field Match:</b>';
				'</td>';
				'<td bgcolor="white">';
				'<select name="htype">';
				'<option value="OR"';
				if: (var:'htype') == 'OR';
					' selected';
				/if;
				
				'>Any Fields';
				'<option value="AND"';
				if: (var:'htype') == 'AND';
					' selected';
				/if;
				'>All Fields';
				'</select>';
				'</td>';
			'</tr>';
			'<tr valign="top">';
				'<td bgcolor="white" colspan=2 align=right>';
				'<input type="submit" value="Search">';
				'</td>';
			'</tr>';
				
		'</table>';
			
		
?>