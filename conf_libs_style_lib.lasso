<style>
TD {color:#000000;font-size:10pt;font-family:arial, Geneva, Arial, Helvetica, san-serif;}
B {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
P {font-size:12pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
a { color: #0066FF; text-decoration: none }
a:active { color: red; text-decoration:}
a:visited { color: #0066FF; text-decoration: none }
a:hover { color: red; text-decoration: none}
input { color: #000000; font-weight: normal; font-size: 10px; font-family: Tahoma, Verdana, Arial, Helvetica }
textarea { color: #000000; font-weight: normal; font-size: 10px; font-family: Tahoma, Verdana, Arial, Helvetica; background-color: #ffffff }
select { color: #000000; font-weight: bold; font-size: 10px; font-family: Tahoma, Verdana, Arial, Helvetica; background-color: #ffffff }
B.body {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
B.subNav {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
P {font-size:12pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
P.body {font-size:10pt;font-family:Tahoma, Geneva, Arial, Helvetica, san-serif;}
<?lassoscript	

	// iterate through the style sheets to be pulled in
	
	local:'CCSNumber' = (dCoreModTag_core_appinfo->getMasterTemplate:'1')->(split:'_')->(get:3);
	local:'styleArray' = (array:'master','account','content','section','category','navigation','homepage');
	iterate: #styleArray, local:'styleArrayItem';
		protect;
			include:(#CCSNumber + '_dCoreStyle_' + #styleArrayItem + '.lasso');
		/protect;
	/iterate;
?>
</style>