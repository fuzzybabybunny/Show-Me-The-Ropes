// INITIALIZE THE MAP
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
    // var pinGuideReviews = data["pin"]["guide_textReview"];

    $('#firstHeading').html(pinTitle);
    $('#bodyContent').html(pinDescription);
    $('#pinGuideFirstName').html(pinGuideFirstName);
    $('#pinGuideLastName').html(pinGuideLastName);
    $('#pinGuideRating').html(pinGuideRating);
    // $('#pinGuideReviews').html(pinGuideReviews);
  })
}

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
  var map = new google.maps.Map(map_canvas, map_options);
  window.map = map;

// PRE-SET MARKERS
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title:"This is marker 1!",
    id: 1
  });
  var marker2 = new google.maps.Marker({
    position: myLatlng2,
    draggable:true,
    map: map,
    title:"This is a draggable marker!",
    id: 2
  });


// CONTENT OF THE MARKERS

  var contentString = '<div style="width: 500px; height: 300px;" id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
        '<h1 id="firstHeading" class="firstHeading"></h1>'+
          '<div id="bodyContent">'+
          '</div>'+
          '<div id="pinGuideFirstName">, '+
          '</div>'+
          '<div id="pinGuideLastName">'+
          '</div>'+
          '<div id="pinGuideRating">'+
          '</div>'
          // '<div id="pinGuideReviews">'+
          //   '<p></p>'+
          // '</div>'+
      '</div>';

  var infowindow = new google.maps.InfoWindow({
      content: contentString,
    });
// ADDING MARKERS


  // function placeMarker(location) {
  // var marker = new google.maps.Marker({
  //     position: location,
  //     map: map
  // });

  // map.setCenter(location);
  // console.log(location);
  // }

  // google.maps.event.addListener(map, 'click', function(event) {
  //   placeMarker(event.latLng);
  // });


// LISTENING FOR ICON CLICKS
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
    console.log(marker.position);
    console.log("Pin ID: " + marker.id);
    // getMapData(marker.id);
    getPinData(marker.id);
    // console.log("Pin Title: " + pinTitle);
    //ajax call using marker.id
    //console.log HandlebarsTemplate["something"]
  });

}

// CREATING THE MAP
google.maps.event.addDomListener(window, 'load', initialize);

