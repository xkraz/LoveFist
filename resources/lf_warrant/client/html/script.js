$(function() {
	window.addEventListener('message', function(event) {
		if (event.data.type == "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none";
		}
	});

	document.onkeyup = function (data) {
		if (data.which == 27) { // Escape key
			$.post('http://lf_warrant/escape', JSON.stringify({}));
		}
	};
	
	$("#register").submit(function(event) {
		event.preventDefault(); // Prevent form from submitting
		
		// Verify date
		var date = $("#dateofbirth").val();
		var dateCheck = new Date($("#dateofbirth").val());

		if (dateCheck == "Invalid Date") {
			date == "invalid";
		}

		$.post('http://lf_warrant/register', JSON.stringify({
			firstname: $("#firstname").val(),
			lastname: $("#lastname").val(),
			gender: $("#gender").val(),
			desc: $("#desc").val(),
			reason: $("#reason").val(),
			seen: $("#seen").val(),
		}));
	});
});
