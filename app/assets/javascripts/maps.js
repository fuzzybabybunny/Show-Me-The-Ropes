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

  getAllPins()

}


// LISTENING FOR PIN CLICKS
function iconClick(marker, infowindow){
    google.maps.event.addListener(marker, 'click', function() {
      if(!marker.open){
          infowindow.open(map,marker);
          marker.open = true;
      }
      else{
          infowindow.close();
          marker.open = false;
      }
      google.maps.event.addListener(map, 'click', function() {
          infowindow.close();
          marker.open = false;
      });

    console.log(marker.position);
    console.log("Pin ID: " + marker.id);
    getPinData(marker.id);
  });
}



// DROP DATABASE PINS ON MAP
function dbMarker(pinLat, pinLong, pinID, pinActivity){
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(pinLat, pinLong),
    map: map,
    title: pinActivity,
    id: pinID
    });
  var pinContent = document.getElementById('pinContent');
  var infowindow = new google.maps.InfoWindow({
      content: pinContent,
    });

  // closeInfoWindow = function() {
  //   infowindow.close();
  //   };
  // google.maps.event.addListener(map, 'click', closeInfoWindow);
  iconClick(marker, infowindow)
}


// RETRIEVE ALL PINS FROM DB
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
      var pinActivity = data["pins"][i]["pin"]["activity"];

      dbMarker(pinLat, pinLong, pinID, pinActivity)
    }
  })
}


// GET DATA FROM PINS
function getPinData(id, template) {
  // First AJAX call to get the data from the pin that is clicked.
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
    var pinGuideEmail = data["pin"]["guide_email"];

    $('#firstHeading').html(pinTitle);
    $('#bodyContent').html(pinDescription);
    $('#pinGuideName').html(pinGuideFirstName + " " + pinGuideLastName);
    $('#pinGuideRating').html(pinGuideRating);

    $.ajax({
      url: "/api/current_user",
      type: "GET",
      data: "JSON"
    }).success(function(data){
      console.log("Here is all the current user data: " + data);
      var currentUserEmail = data["user"]["email"];
      var currentUserFirstName = data["user"]["first_name"];
      var currentUserLastName = data["user"]["last_name"];

      var messageData = {
        guideFirstName : pinGuideFirstName,
        guideLastName : pinGuideLastName,
        guideEmail : pinGuideEmail,
        pinActivity : pinTitle,
        pinDescription2 : pinDescription,
        userEmail : currentUserEmail,
        userFirstName : currentUserFirstName,
        userLastName : currentUserLastName
      };

      console.log("Guide and Current User Data: ");
      console.log(messageData);

      var messageSource = $('#messagePinGuideForm').html();

      var messageHTML = HandlebarsTemplates['messages/index'](messageData);

      $( "#messagePinGuideButton" ).on("click", function() {
        $('.popin').html(messageHTML).fadeIn();
      });

      console.log(messageHTML);

      // When the Contact Guide button is pressed

      // $( "#messagePinGuideButton" ).on("click", function() {
      //   $.ajax({
      //     url: "/message.html",
      //     type: "GET",
      //     data: html
      //     success: function(response) {
      //       $('.popin').html(response).fadeIn();
      //     },
      //     beforeSend: function() {
      //       $('.popin').addClass('loading');
      //     },
      //     complete: function() {
      //       $('.popin').removeClass('loading');
      //     }
      //   });
      // });

    });
  });
};


// CREATE THE MAP
google.maps.event.addDomListener(window, 'load', initialize);
