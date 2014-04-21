$(document).ready(function() {
  $( "#profile" ).on("click", function() {
    $.ajax('/profile.html', {
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

  $( "#pinGuideName" ).on("click", function() {
    $.ajax('/profile.html', {
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

  // $( "#pinGuideName" ).on("click", function() {
  //   $.ajax({
  //     url: "/api/pins/"+id,
  //     type: "GET",
  //     data: "JSON"
  //   }).success(function(response) {
  //     $('.popin').html(response).fadeIn();
  //   }).beforeSend(function() {
  //     $('.popin').addClass('loading');
  //   }).complete(function() {
  //       $('.popin').removeClass('loading');
  //   });
  // });

  $( ".close" ).on("click", function() {
    $.get('/profile.html', function(response) {
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