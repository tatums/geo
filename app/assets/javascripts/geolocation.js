    var geocoder = new google.maps.Geocoder();

    function success(position) {
      var lat = position.coords.latitude 
      var lng = position.coords.longitude

      //for (key in position.coords) {alert(key)};


//********************************************************
      //REVERSE GEO
      geocoder.geocode({'latLng': new google.maps.LatLng(position.coords.latitude, position.coords.longitude)}, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[0]) {
            //$('.address').append(results[0].formatted_address);  
						$('input#address').val(results[0].formatted_address);
						
						// 	var request =	$.ajax({
						// 			url: "set_location.html",
						// 			type: "POST",
						// 			data: {results[0].formatted_address},
						// 			dataType: "html",
						// 		  context: document.body
						// 			
						// 		});
						// 
						// request.fail(function(jqXHR, textStatus) {
						//   alert( "Request failed: " + textStatus );
						// });

					//	alert("Ehmmmm");


            //console.log(arguments);
            //document.body.innerHTML += 'google.maps.Geocoder ' + results[0].formatted_address;
          }
        } else {
          console.log(arguments);
          //document.body.innerHTML += 'Geocoder failed due to: ' + status;
        }
      });

//********************************************************

      $('.coordinates').append(lat, ", ", lng);  
      console.log(lat, lng);
    }


		
		// request.fail(function(jqXHR, textStatus) {
		//   alert( "Request failed: " + textStatus );
		// });


    function error(msg) {
       console.log(arguments);
    }

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(success, error);
    } else {
      error('not supported');
    }


