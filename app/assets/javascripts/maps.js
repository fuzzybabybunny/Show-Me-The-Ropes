// INITIALIZE THE MAP
function initialize() {
  var map_canvas = document.getElementById('map_canvas');
  var myLatlng = new google.maps.LatLng(22.25, 114.1667);
  var myLatlng2 = new google.maps.LatLng(22.256, 114.3);
  var map_options = {
    center: myLatlng,
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: [
        // {
        //   stylers: [
        //     { hue: "#00ffe6" },
        //     { saturation: -20 }
        //   ]
        // },{
        //   featureType: "road",
        //   elementType: "geometry",
        //   stylers: [
        //     { lightness: 100 },
        //     { visibility: "simplified" }
        //   ]
        // },{
        //   featureType: "road",
        //   elementType: "labels",
        //   stylers: [
        //     { visibility: "off" }
        //   ]
        // }
      ]
   }
  var map = new google.maps.Map(map_canvas, map_options)


// PRE-SET MARKERS
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title:"This is marker 1!"
  });
  var marker2 = new google.maps.Marker({
    position: myLatlng2,
    draggable:true,
    map: map,
    title:"This is a draggable marker!"
  });


// ADDING MARKERS
  function placeMarker(location) {
  var marker = new google.maps.Marker({
      position: location,
      map: map
  });

  map.setCenter(location);
  console.log(location);
  }

  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });


// LISTENING FOR ICON CLICKS
  google.maps.event.addListener(marker, 'click', function() {
    console.log(marker.position);
  });

}

// CREATING THE MAP
google.maps.event.addDomListener(window, 'load', initialize);