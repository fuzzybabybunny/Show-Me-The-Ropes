// INITIALIZE THE MAP
function initialize() {
  var map_canvas = document.getElementById('map_canvas');
  var myLatlng = new google.maps.LatLng(22.25, 114.1667);
  var map_options = {
    center: new google.maps.LatLng(19, 0),
    zoom: 3,
    mapTypeId: google.maps.MapTypeId.TERRAIN,
    styles: [
      ]
   }
  var map = new google.maps.Map(map_canvas, map_options);
  window.map = map;

  getAllPins()

}


// LISTENING FOR PIN CLICKS
function pinClick(marker, infowindow){
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
function dropMarker(pinLat, pinLong, pinID, pinActivity){
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
  pinClick(marker, infowindow)
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

      dropMarker(pinLat, pinLong, pinID, pinActivity)
    }
  })
}


// GET DATA FROM PINS, GET DATA FROM CURRENT USER,
// CONTACT FORM TO MESSAGE GUIDE
function getPinData(id, template) {

  // First AJAX call to get the data from the pin that is clicked.
  $.ajax({
    url: "/api/pins/"+id,
    type: "GET",
    data: "JSON"
  }).success(function(data){

    var pinTitle = data["pin"]["title"]
    var pinActivity = data["pin"]["activity"];
    var pinDescription = data["pin"]["description"];
    var pinLong = data["pin"]["long"];
    var pinLat = data["pin"]["lat"];
    var pinGuideFirstName = data["pin"]["guide_first_name"];
    var pinGuideLastName = data["pin"]["guide_last_name"];
    var pinGuideRating = data["pin"]["guide_rating"];
    var pinGuideEmail = data["pin"]["guide_email"];
    var pinGuideExperience = data["pin"]["guide_experience"];
    var pinGuideAvatar = data["pin"]["guide_avatar"]["avatar"]["url"];
    var pinGallery = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="400" height="300" id="ssidx"><param name="movie" value="http://cdn.smugmug.com/ria/ShizamSlides-2013072402.swf" /><param name="flashVars" value="AlbumID=10189556&AlbumKey=9Gkc2G&transparent=true&bgColor=&borderThickness=&borderColor=&useInside=&endPoint=&mainHost=cdn.smugmug.com&VersionNos=2013072402&width=400&height=300&clickToImage=true&captions=true&showThumbs=false&autoStart=true&showSpeed=true&pageStyle=white&showButtons=true&randomStart=false&randomize=false&splash=http%3A%2F%2Fwww.smugmug.com%2Fimg%2Fria%2FShizamSlides%2Fsmugmug_black.png&splashDelay=0&crossFadeSpeed=350" /><param name="wmode" value="transparent" /><param name="allowNetworking" value="all" /><param name="allowScriptAccess" value="always" /><embed src="http://cdn.smugmug.com/ria/ShizamSlides-2013072402.swf" flashVars="AlbumID=10189556&AlbumKey=9Gkc2G&transparent=true&bgColor=&borderThickness=&borderColor=&useInside=&endPoint=&mainHost=cdn.smugmug.com&VersionNos=2013072402&width=400&height=300&clickToImage=true&captions=true&showThumbs=false&autoStart=true&showSpeed=true&pageStyle=white&showButtons=true&randomStart=false&randomize=false&splash=http%3A%2F%2Fwww.smugmug.com%2Fimg%2Fria%2FShizamSlides%2Fsmugmug_black.png&splashDelay=0&crossFadeSpeed=350" width="400" height="300" wmode="transparent" type="application/x-shockwave-flash" allowScriptAccess="always" allowNetworking="all" ></embed></object>';
    $('#firstHeading').html(pinTitle);
    $('#bodyActivity').html(pinActivity);
    $('#bodyContent').html(pinDescription);
    $('.pinGuideName').html(pinGuideFirstName + " " + pinGuideLastName);
    $('#pinGuideRating').html(pinGuideRating);
    $('#pinGallery').html(pinGallery);

    // Second AJAX call nested inside the first one to get the data
    // of the current logged in user.
    $.ajax({
      url: "/api/current_user",
      type: "GET",
      data: "JSON"
    }).success(function(data){

      if(! data["user"]){
        var currentUserEmail = "non User";
        var currentUserFirstName = "non User";
        var currentUserLastName = "non User"}
        else{
        var currentUserEmail = data["user"]["email"];
        var currentUserFirstName = data["user"]["first_name"];
        var currentUserLastName = data["user"]["last_name"]};

      var messageData = {
        guideFirstName : pinGuideFirstName,
        guideLastName : pinGuideLastName,
        guideEmail : pinGuideEmail,
        guideExperience : pinGuideExperience,
        guideAvatar : pinGuideAvatar,
        guideRating : pinGuideRating,
        pinActivity : pinTitle,
        pinDescription2 : pinDescription,
        userEmail : currentUserEmail,
        userFirstName : currentUserFirstName,
        userLastName : currentUserLastName
      };

      var messageHTML = HandlebarsTemplates['messages/index'](messageData);

      var profileHTML = HandlebarsTemplates['application/guide_profile'](messageData);

      // console.log(profileHTML);

      $( "#pinGuideProfileButton" ).on("click", function() {
        $('.popin').html(profileHTML).fadeIn();
      });

      $( "#messagePinGuideButton" ).on("click", function() {
        $('.popin').html(messageHTML).fadeIn();
      });
    });
  });
};


// CREATE THE MAP
google.maps.event.addDomListener(window, 'load', initialize);
