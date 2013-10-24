$(document).ready(function() {
  $('form#create-event').on('submit', function(event) {
    event.preventDefault();
    console.log("We are preventing form submission...yesssss!")
      var data = $('#create-event').serialize();
      var buttons = $('.buttons:first').html();

    $.post('/events/create/ajax', data, function(response) {
      console.log(response)
      $('ol#events').append("<li>" + response + buttons + "</li><br>");
    })
  });
});





  // // send an HTTP DELETE request for the sign-out link
  // $('a#sign-out').on("click", function (e) {
  //   e.preventDefault();
  //   var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
  //   request.done(function () { window.location = "/"; });
  // });
