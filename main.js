function dice(max) {
	return (Math.floor(Math.random()*(max)));
}



function dreplace(descinput, dparams) {
	var i=-1;
	var n=dparams.length;
	var pattern
	var doutput=descinput;
	while ( ++ i < n ) {
		pattern=new RegExp("%"+i,"g");
		doutput=doutput.replace(pattern,dparams[i]);
	}
	return doutput;
}


btn_generate.onclick = newwep;

function newwep() {
	//faction
	var newfac=defobj.faction[dice(defobj.faction.length)];
	var newclass=defobj.wepclass[dice(defobj.wepclass.length)];
	var newtype=defobj.weptype[dice(defobj.weptype.length)];
	var newsubtype=defobj.subtype[dice(defobj.subtype.length)];
	var newenemy=defobj.faction[dice(defobj.faction.length)];
	var wepname=classobj[newclass][newfac];
	var weptype=typeobj[newtype][newsubtype];

	var newattach=detailobj.attach[dice(detailobj.attach.length)];
	var newdetail=detailobj.detail[dice(detailobj.detail.length)];
	var newcons=detailobj.cons[dice(detailobj.cons.length)];
	var newage=detailobj.age[dice(detailobj.age.length)];
	//do description
	var newdescnum=dice(descobj.length);
	var paramArray = new Array();
	paramArray=JSON.parse(JSON.stringify(descobj[newdescnum].params));
	var descstring=descobj[newdescnum].descString;
	for (var i = 0; i < paramArray.length; i++) {
		if (paramArray[i]=="*solider*") {
			paramArray[i]=factionobj.faction[newfac][dice(factionobj.faction[newfac].length)];
		}
		if (paramArray[i]=="*enemy*") {
			paramArray[i]=factionobj.faction[newenemy][dice(factionobj.faction[newenemy].length)];
		}
		if (paramArray[i]=="*ammo*") {
			paramArray[i]=weptype;
		}
		if (paramArray[i]=="*weapon*") {
			console.log(wepname);
			paramArray[i]=wepname;
		}
	}
	var descs=dreplace(descstring,paramArray);


	//end doing description

	var finalwep="You have discovered a ";
	printfac = newfac.charAt(0).toUpperCase() + newfac.substr(1)
	finalwep=finalwep.concat(printfac," ",wepname,". It ",newdetail," and a",newattach,". It fires ",weptype,"s.\n","Unfortunately it",newcons,". Its age is ",newage,"\n",descs,"\n\n");
	ta_output.value=ta_output.value.concat(finalwep);
	getId("ta_output").scrollTop = getId("ta_output").scrollHeight;
}