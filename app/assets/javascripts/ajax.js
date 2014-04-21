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

  $( "#message" ).on("click", function() {
    $.get('/message.html', function(response) {
        $('.popin').html(response).fadeIn();
      });
    });


  });