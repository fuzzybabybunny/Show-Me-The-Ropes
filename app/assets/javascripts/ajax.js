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


$(".popin").on("click", ".close_message", function(event){
 alert("test");
 debugger;

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