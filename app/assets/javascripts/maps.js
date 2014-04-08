function initialize() {
      var map_canvas = document.getElementById('map_canvas');
      var myLatlng = new google.maps.LatLng(22.25, 114.1667);
      var map_options = {
        center: myLatlng,
        zoom: 12,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: [
            {
              stylers: [
                { hue: "#00ffe6" },
                { saturation: -20 }
              ]
            },{
              featureType: "road",
              elementType: "geometry",
              stylers: [
                { lightness: 100 },
                { visibility: "simplified" }
              ]
            },{
              featureType: "road",
              elementType: "labels",
              stylers: [
                { visibility: "off" }
              ]
            }
          ]

       }
      var map = new google.maps.Map(map_canvas, map_options)

      var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title:"Hello World!"
      });
    }

    google.maps.event.addDomListener(window, 'load', initialize);