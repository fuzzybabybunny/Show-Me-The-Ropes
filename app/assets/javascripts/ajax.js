$(document).ready(function() {

  // $( "#pinGuideName" ).on("click", function() {
  //   $.ajax('/profile.html', {
  //     success: function(response) {
  //       $('.popin').html(response).fadeIn();
  //       },
  //     beforeSend: function() {
  //       $('.popin').addClass('loading');
  //       },
  //     complete: function() {
  //       $('.popin').removeClass('loading');
  //       }
  //     });
  //   });

  // RETRIEVE ALL CURRENT USER'S PINS FROM DB
  // GENERATES VIEW OF ALL USER'S PINS
  function getAllCurrentUserPins() {

    $.ajax({
      url: "/api/current_user",
      type: "GET",
      data: "JSON"
    }).success(function(data){
      console.log(data);
      var guidePinsHTML = HandlebarsTemplates['pins/index'](data);
      console.log(guidePinsHTML);

      $('.popin').html(guidePinsHTML).fadeIn();

    });

  };

  $("#home").on("click", "#messageclose", function(event){
    $('#messagePinGuideProfile').fadeOut();
  });

  $("#home").on("click", "#messageclose", function(event){
    $('#messagePinGuideForm').fadeOut();
  });

  $("#home").on("click", "#mypins", function(event){
    getAllCurrentUserPins();
  });

  $( "#register" ).on("click", function() {
    $.ajax('/register.html', {
      success: function(response) {
        $('.popin').html(response).fadeIn();
        },
      beforeSend: function() {
        $('.popin').addClass('loading');
        },
      complete: function() {
        $('.popin').removeClass('loading');
        }
      });
    });

  // $( "#addpin" ).on("click", function() {
  //   $.ajax('/pindrop.html', {
  //     success: function(response) {
  //       $('.popin').html(response).fadeIn();
  //       },
  //     beforeSend: function() {
  //       $('.popin').addClass('loading');
  //       },
  //     complete: function() {
  //       $('.popin').removeClass('loading');
  //       }
  //     });
  //   });

  $( "#messageclose" ).on("click", function() {
      console.log("Guide Message is being closed!");
      $('#messagePinGuideForm').fadeOut();
    });

  $( "#pinGuideName" ).on("click", function() {
    $.ajax({
      url: "/api/pins/" & 'guide_id',
      type: "GET",
      data: "JSON"
    }).success(function(response) {
      $('.popin').html(response).fadeIn();
    }).beforeSend(function() {
      $('.popin').addClass('loading');
    }).complete(function() {
        $('.popin').removeClass('loading');
    });
  });

  $( ".close_profile" ).on("click", function() {
    $.get('/profile.html', function(response) {
        $('.popin').html(response).fadeOut();
      });
    });

  $( ".close_register" ).on("click", function() {
    $.get('/register.html', function(response) {
        $('.popin').html(response).fadeOut();
      });
    });

  $( ".close_message" ).on("click", function() {
    $.get('/message.html', function(response) {
        $('.popin').html(response).fadeOut();
      });
    });

  $( ".close_pindrop" ).on("click", function() {
    $.get('/pindrop.html', function(response) {
        $('.popin').html(response).fadeOut();
      });
    });

  $("#loginButton").on("click", function() {
    $.get("/logged_in.html", function(response) {
      $("#userControl").html(response).fadeIn();
    });
  });

  $( "#message" ).on("click", function() {
    $.get('/message.html', function(response) {
        $('.popin').html(response).fadeIn();
      });
    });

  });