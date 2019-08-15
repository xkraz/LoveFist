var genders = {
	t: "Transgender",
	m: "Male",
	f: "Female"
};



window.addEventListener('message', function(event) {
    if (event.data.fnc === 'open') {
		$(".wrapper").show();
    } else if (event.data.fnc == 'updateCalls') {
		updateCalls(event.data.data);
    } else if (event.data.fnc == 'close') {
		$(".wrapper").hide();
		$("#newCallWeapper").hide();
		$("#newCallType").val("");
		$("#newCallMessage").val("");
		$("#newCallLocation").val("");
    } else if (event.data.fnc == 'plateLookup') {
		setPlate(event.data.data);
	} else if (event.data.fnc == 'charList') {
		setCharTable(event.data.data);
	} else if (event.data.fnc == 'showChar') {
		setCharResult(event.data.data);
	}

});

function updateCalls(data) {
	$("#activeCalls-content table tbody").html("");
	data.forEach(function(call) {
		var units = ``;
		(call.units).forEach(function(unit, idx) {
			if (idx != 0) {
				units += `<br />`;
			}
			units += unit;
		});
		if (units == ``) {
			units = `None`
		}
		var gps = ""
		if (call.gpspos != "-1") {
			gps = "<button class='btn' id='markGPS' data-pos='" + JSON.stringify(call.gpspos) + "'>GPS</button>";
		}
		$("#activeCalls-content table tbody").append(`
			<tr>
				<td>`+call.id+`</td>
				<td>`+call.type+`</td>
				<td>`+call.message+`</td>
				<td>`+call.location+`</td>
				<td>`+units+`</td>
				<td>
					`+gps+`
					<button class="btn" id="respond" data-id="`+call.id+`">Respond</button>
					<button class="btn" id="code4" data-id="`+call.id+`">Code 4</button>
				</td>
			</tr>
		`);
	});
	if ($("#activeCalls-content table tbody").html() == "") {
		$("#activeCalls-content table tbody").html(`<td colspan="6">There are currently no active calls.</td>`);
	}
}

$(document).on("click", "#markGPS", function() {
	sendData("markOnGPS", {pos: $(this).data("pos")})
})
$(document).on("click", "#respond", function() {
	sendData("respond", {id: $(this).data("id")})
})
$(document).on("click", "#code4", function() {
	sendData("code4", {id: $(this).data("id")})
})
$(document).on("click", "#addfine", function() {
	sendData("addfine", {id: $(this).data("id")})
})
$(document).on("click", "#saveCallsign", function() {
	sendData("setCallsign", {callsign: $("#callsign ").val()})
})


function setCharResult(data) {
	if (data[0].id == '') {
		$(".searchResults").html("<span style='text-align: center;'>An error occurred getting the records of this person.</span>");
	} else {
		crimes = ``;
		(data[0].crimes).forEach(function(crime) {
			crimes += `
				<tr>
					<td>`+crime.dateofcrime+`</td>
					<td>`+crime.charges+`</td>
					<td>`+crime.fine+`</td>
					<td>`+crime.sentence+`</td>
					<td>`+crime.notes+`</td>
					<td>`+crime.issued+`</td>
					<td>`+crime.id+`</td>
				</tr>
			`;
		});
		if (crimes == ``) {
			crimes = `<tr><td colspan="2">This person has no criminal record.</td></tr>`
		}
		
		
		fines = ``;
		(data[0].fines).forEach(function(fine) {
			var d = new Date(fine.date);
			fines += `
				<tr>
					<td>`+d.toLocaleString("en-AU")+`</td>
					<td>`+fine.label+`</td>
					<td>$`+(fine.amount).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');+`</td>
				</tr>
			`;
		});
		if (fines == ``) {
			fines = `<tr><td colspan="2">This person has no unpaid fines.</td></tr>`
		}
		
	
		
		licenses = ``;
		(data[0].licenses).forEach(function(license) {
			licenses += `
				<tr>
					<td>`+license.type+`</td> 
				</tr>
			`;
		});
		if (licenses == ``) {
			licenses = `<tr><td colspan="2">This person has no licenses.</td></tr>`
		}
		
		bolos = ``;
		(data[0].bolos).forEach(function(bolo) {
			bolos += `
				<tr>
					<td>`+bolo.firstname+`</td> 
					<td>`+bolo.lastname+`</td> 
					<td>`+bolo.gender+`</td>
					<td>`+bolo.description+`</td>
					<td>`+bolo.reason+`</td>
					<td>`+bolo.seen+`</td>
					<td>`+bolo.datee+`</td>
					<td>`+bolo.id+`</td>
				</tr>
			`;
		});
		if (bolos == ``) {
			bolos = `<tr><td colspan="2">There are no Active Bolos!</td></tr>`
		}
		
		
		warrants = ``;
		(data[0].warrants).forEach(function(warrant) {
			warrants += `
				<tr>
					<td>`+warrant.firstname+`</td> 
					<td>`+warrant.lastname+`</td> 
					<td>`+warrant.gender+`</td>
					<td>`+warrant.description+`</td>
					<td>`+warrant.reason+`</td>
					<td>`+warrant.seen+`</td>
					<td>`+warrant.datee+`</td>
					<td>`+warrant.id+`</td>
				</tr>
			`;
		});
		if (warrants == ``) {
			warrants = `<tr><td colspan="2">There are no active Warrants!</td></tr>`
		}
		medicals = ``;
		(data[0].medicals).forEach(function(medical) {
			medicals += `
				<tr>
				
					<td>`+medical.dateofinjury+`</td>
					<td>`+medical.injury+`</td>
					<td>`+medical.description+`</td>
					<td>`+medical.treatment+`</td>
					<td>`+medical.perscription+`</td>
					<td>`+medical.issuedby+`</td>
					<td>`+medical.id+`</td>
				</tr>
			`;
		});
		if (medicals == ``) {
			medicals = `<tr><td colspan="2">This person has no medical records.</td></tr>`
		}
		
		$(".searchResults").html(`
			<h2>Criminal Records for `+data[0].firstname+" "+data[0].lastname+`</h2>
			<h4>DOB: `+data[0].dateofbirth+`<br />Height: `+data[0].height+`cm<br/>Gender: `+genders[data[0].sex]+`</h4>
			<table class="table">
				<thead>
					<tr>
						<th>Date</th>
						<th>Charges</th>
						<th>Fine</th>
						<th>Sentence</th>
						<th>Notes</th>
						<th>Issued By</th>
						<th>Crime ID</th>
					</tr>
				</thead>
				<tbody>`+crimes+`</tbody>
			</table>
			<br /><br />
			<hr /><br />
			<h2>Medical Records</h2>
			<table class="table">
				<thead>
					<tr>
						<th>Date</th>
						<th>Injury</th>
						<th>Description</th>
						<th>Treatment</th>
						<th>Perscription</th>
						<th>Issued By</th>
						<th>Medical ID</th>
					</tr>
				</thead>
				<tbody>`+medicals+`</tbody>
			</table>
			<br /><br />
			<hr /><br />
			<h2>Licenses</h2>
			<table class="table">
				<thead>
					<tr>
						<th>Type</th>
					</tr>
				</thead>
				<tbody>`+licenses+`</tbody>
			</table>`

		);
	$(".searchResultsbolos").html(`
			<h3>Active Bolos</h2>
			<table class="table">
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Gender</th>
						<th>Description</th>
						<th>Reason</th>
						<th>Last Seen</th>
						<th>Date</th>
						<th>Bolo ID</th>
					</tr>
				</thead>
				<tbody>`+bolos+`</tbody>
			</table>`
		);
	$(".searchResultswarrant").html(`
			<h3>Active Warrants</h2>
			<table class="table">
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Gender</th>
						<th>Description</th>
						<th>Reason</th>
						<th>Last Seen</th>
						<th>Date</th>
						<th>Warrant ID</th>
					</tr>
				</thead>
				<tbody>`+warrants+`</tbody>
			</table>`
		);
	}
}

function setPlate(data) {
	if (data.owner == '') {
		$(".plateResults").html("<span style='text-align: center;'>Plate: "+$("#plate").val()+" - Reported as a stolen vehicle.</span>");
	} else {
		if (data.numberOfImpounds > 0) {
			var date = new Date(data.lastImpound);
			$(".plateResults").html(`<span style="text-align: center;">Plate: `+$("#plate").val()+` - Registered to "`+data.firstname+` `+data.lastname+`" (`+data.name+`)</span>
			<br /><span style="text-align: center;">This vehicle has been impounded `+data.numberOfImpounds+` times and was last impounded on<br />`+date.toString()+`.</span>
			<br /><button class="btn" style="width: 200px; margin: 20px auto;" id="plateFetchChar" data-id="`+data.character+`">View Profile</button>`);
		} else {
		$(".plateResults").html(`<span style="text-align: center;">Plate: `+$("#plate").val()+` - Registered to "`+data.firstname+` `+data.lastname+`" (`+data.name+`)</span>
			
			<br /><button class="btn" style="width: 200px; margin: 20px auto;" id="plateFetchChar" data-id="`+data.id+`">View Profile</button>`);
		}
	}
}
//<br /><button class="btn" style="width: 200px; margin: 20px auto;" id="plateFetchChar" data-id="`+data.character+`">View Profile</button>
//<br /><span style="text-align: center;">This vehicle has never been impounded.</span>
function setCharTable(data) {
	if (data[0].id == '') {
		var template = `
			<table class="table">
				<thead>
					<tr>
						<th>Character Name</th>
						<th>DOB</th>
						<th>Sex</th>
						<th>Height</th>
					</tr>
				</thead>
				<tobdy>
					<tr>
						<td colspan="4">There are no characters matching your search.</td>
					</tr>
				</tobdy>
			</table>
		
		`;
		$(".searchResults").html(template);
	} else {
		var template = `
			<table class="table">
				<thead>
					<tr>
						<th>Character Name</th>
						<th>DOB</th>
						<th>Sex</th>
						<th>Height</th>
						<th></th>
					</tr>
				</thead>
				<tobdy>`;
		data.forEach(function(character) {
			template += `<tr>
						<td>`+character.firstname+` `+character.lastname+`</td>
						<td>`+character.dateofbirth+`</td>
						<td>`+genders[character.sex]+`</td>
						<td>`+character.height+`cm</td>
						<td><button id="fetchChar" data-id="`+character.id+`" class="btn">View</button></td>

					</tr>`;
		});
		template += `</tobdy>
			</table>
		
		`;
		$(".searchResults").html(template);
	}
}

$(document).on("click", "#lookupPlate", function() {
    sendData("lookupPlate", {plate: $("#plate").val()});
})

$(document).on("click", "#lookupChar", function() {
    sendData("lookupChars", {firstname: $("#firstName").val(), lastname: $("#lastName").val()});
})
$(document).on("click", "#reloadbolo", function() {
    sendData("fetchChar", {id: $(this).data("id")});
})


$(document).on("click", "#fetchChar", function() {
    sendData("fetchChar", {id: $(this).data("id")});
})

$(document).on("click", "#plateFetchChar", function() {
    sendData("fetchChar", {id: $(this).data("id")});
	
	$(".nav a").removeClass("active");
	$('a[href="#crimLookup"]').addClass("active");
	$(".content").children().hide()
	$("#crimLookup-content").show();
})

$(document).on("click", "#submitNewCall", function() {
    sendData("newCall", {
		type: $("#newCallType").val(),
		message: $("#newCallMessage").val(),
		location: $("#newCallLocation").val()
	});
	$("#newCallWeapper").hide();
	$("#newCallType").val("");
	$("#newCallMessage").val("");
	$("#newCallLocation").val("");
})


$(document).on("click", "#newCall", function() {
	$("#newCallWeapper").show();
})

$(document).on("click", ".nav a", function() {
	$(".nav a").removeClass("active");
	$(this).addClass("active");
	$(".content").children().hide()
	$(($(this).attr("href"))+"-content").show();
});

// Send data to lua for processing.
function sendData(name, data) {
    $.post("http://lf_cad/" + name, JSON.stringify(data), function(datab) {
        if (datab != "ok"){
            console.log(datab);
        }            
    });
}



document.onkeyup = function (data) {
    if (data.which == 27 || data.which == 120) { // Escape key and F11 key.
		sendData("close", {});
    }
};







