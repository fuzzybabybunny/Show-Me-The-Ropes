$( "#addpin" ).on( "click", function() {

  console.log("pindrop on");

  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });

  function placeMarker(location) {

    var marker = new google.maps.Marker({
        position: location,
        draggable: true,
        animation: google.maps.Animation.DROP,
        map: window.map
    });

    map.setCenter(location);
    console.log("location: " + location);
    console.log("lat: " + location.k);
    console.log("long: " + location.A);
    var latitude = location.k;
    var longitude = location.A;

    google.maps.event.addListener(marker, 'dragend', function (event) {
      latitude = marker.getPosition().lat();
      longitude = marker.getPosition().lng();
      console.log("lat: " + latitude);
      console.log("long: " + longitude);

    });

    var contentString = document.getElementById('newPinForm');

    var newPinInfoWindow = new google.maps.InfoWindow({
      content: contentString
    });

    google.maps.event.addListener(marker, 'click', function() {
      newPinInfoWindow.open(map,marker);
    });

  };

});