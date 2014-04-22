$( "#addpin" ).on( "click", function() {
  console.log("pindrop on");
  function placeMarker(location) {
  var marker = new google.maps.Marker({
      position: location,
      draggable:true,
      animation: google.maps.Animation.DROP,
      map: window.map
  });
  map.setCenter(location);
  google.maps.event.addListener(marker, 'dragend', function (event) {
    var latitude = this.getPosition().lat();
    var longitude = this.getPosition().lng();
    console.log("lat: " + latitude);
    console.log("long: " + longitude);
  });
  // var latitude = location.k;
  // var longitude = location.A;
  // console.log("lat: " + latitude);
  // console.log("long: " + longitude);
  console.log(location);
  }
  // google.maps.event.addListener(map, 'click', function(event) {
  //   placeMarker(event.latLng);
  // });
});