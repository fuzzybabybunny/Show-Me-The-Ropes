// INITIALIZE THE MAP
function initialize() {
  var map_canvas = document.getElementById('map_canvas');
  var myLatlng = new google.maps.LatLng(22.25, 114.1667);
  var map_options = {
    center: new google.maps.LatLng(22.25, 114.2),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: [
      ]
   }
  var map = new google.maps.Map(map_canvas, map_options);
  window.map = map;

  // PRE-SET MARKERS
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title:"This is marker 1!",
    id: 1
  });

  // CONTENT OF THE MARKERS
  var pinContent = document.getElementById('pinContent');
  var infowindow = new google.maps.InfoWindow({
      content: pinContent,
    });

  // GET ALL PINS FROM DB AND LISTEN FOR CLICKS
  getAllPins()
  iconClick(marker, infowindow)
}

// LISTENING FOR ICON CLICKS
function iconClick(marker, infowindow){
    google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
    console.log(marker.position);
    console.log("Pin ID: " + marker.id);
    getPinData(marker.id);
    });
  }

// DROP DATABASE PINS
function dbMarker(pinLat, pinLong, pinID){
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(pinLat, pinLong),
    map: map,
    title: "Database pins",
    id: pinID
    });
  var pinContent = document.getElementById('pinContent');
  var infowindow = new google.maps.InfoWindow({
      content: pinContent,
    });
  iconClick(marker, infowindow)
}

function getAllPins() {
  $.ajax({
    url: "/api/pins/",
    type: "GET",
    data: "JSON"
  }).success(function(data){
    for (var i = 0; i < data["pins"].length; i++) {
      var pinID = data["pins"][i]["pin"]["id"];
      var pinLong = data["pins"][i]["pin"]["long"];
      var pinLat = data["pins"][i]["pin"]["lat"];
      console.log(pinID);
      console.log(pinLat);
      console.log(pinLong);

      dbMarker(pinLat, pinLong, pinID)
    }
  })
}


// GET DATA FROM PINS
function getMapData(id, template) {
  $.ajax({
    url: "/api/users/"+id,
    type: "GET",
    data: "JSON"
  }).done(function(data){
    alert(data["user"]["email"]);
  })
}

function getPinData(id, template) {
  $.ajax({
    url: "/api/pins/"+id,
    type: "GET",
    data: "JSON"
  }).success(function(data){
    console.log("Here is all the pin data: " + data);
    var pinTitle = data["pin"]["activity"];
    var pinDescription = data["pin"]["description"];
    var pinLong = data["pin"]["long"];
    var pinLat = data["pin"]["lat"];
    var pinGuideFirstName = data["pin"]["guide_first_name"];
    var pinGuideLastName = data["pin"]["guide_last_name"];
    var pinGuideRating = data["pin"]["guide_rating"];

    $('#firstHeading').html(pinTitle);
    $('#bodyContent').html(pinDescription);
    $('#pinGuideName').html(pinGuideFirstName + " " + pinGuideLastName);
    $('#pinGuideRating').html(pinGuideRating);
  })
}


// CREATE THE MAP
google.maps.event.addDomListener(window, 'load', initialize);