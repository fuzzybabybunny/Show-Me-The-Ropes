$( "#addpin" ).on( "click", function() {
  console.log("pindrop on");
  function placeMarker(location) {
  var marker = new google.maps.Marker({
      position: location,
      map: window.map
  });
  map.setCenter(location);
  console.log(location);
  }

  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });
  });