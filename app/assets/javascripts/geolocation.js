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
            $('.address').append(results[0].formatted_address);  
            //console.log(arguments);
            //document.body.innerHTML += 'google.maps.Geocoder ' + results[0].formatted_address;
          }
        } else {
          console.log(arguments);
          //document.body.innerHTML += 'Geocoder failed due to: ' + status;
        }
      });

//********************************************************

      $('.cordinates').append(lat, ", ", lng);  
      console.log(lat, lng);
    }

    function error(msg) {
       console.log(arguments);
    }

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(success, error);
    } else {
      error('not supported');
    }
