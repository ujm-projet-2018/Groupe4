function completerFormulaire() {
	var heure = [ '09', '10', '11', '12', '13', '14', '15', '16', '17', '18',
			'19' ];
	var minute = [ '00', '10', '20', '30', '40', '50' ]
	var i;
	for (i = 1; i < 11; i++) {
		document.getElementById("heure").options[i] = new Option(heure[i - 1],
				i);
	}
	for (i = 1; i < 6; i++) {
		document.getElementById("minute").options[i] = new Option(
				minute[i - 1], i);
	}
}

function estFloat(value) {
	var val = parseFloat(value);
	if (isNaN(val))
		return false;
	return true;
}

function verifierDonnees() {
	var flag = 0;
	
	var x = document.forms["publishForm"]["ville"].value;
	if (x == "") {
		document.getElementById("erreur1").style.display = 'initial';
		flag = 1;
	} else {
		document.getElementById("erreur1").style.display = 'none';
		flag = 0;
	}
	
	x = document.forms["publishForm"]["date"].value;
	var y = document.forms["publishForm"]["heure"].options[heure.selectedIndex].value;
	var z = document.forms["publishForm"]["minute"].options[minute.selectedIndex].value;
	if (x == "" || y == "Heure" || z == "Minute") {
		document.getElementById("erreur2").style.display = 'initial';
		flag = 1;
	} else {
		document.getElementById("erreur2").style.display = 'none';
		flag = 0;
	}
	
	x = document.forms["publishForm"]["supermarche"].value;
	if (x == "") {
		document.getElementById("erreur3").style.display = 'initial';
		flag = 1;
	} else {
		document.getElementById("erreur3").style.display = 'none';
		flag = 0;
	}
	
	x = document.forms["publishForm"]["remuneration"].value;
	if (!estFloat(x)) {
		document.getElementById("erreur4").style.display = 'initial';
		flag = 1;
	} else {
		document.getElementById("erreur4").style.display = 'none';
		flag = 0;
	}
	
	x = document.forms["publishForm"]["description"].value;
	if (x == "") {
		document.getElementById("erreur5").style.display = 'initial';
		flag = 1;
	} else {
		document.getElementById("erreur5").style.display = 'none';
		flag = 0;
	}
	
	if (flag == 1) {
		return false;
	}
	return true;
}