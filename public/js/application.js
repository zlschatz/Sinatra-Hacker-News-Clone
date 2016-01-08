$(document).ready(function() {

  $("#up_vote").on("click", function(event){
    event.preventDefault();
    var href = $(event.target).attr('href')
    $.ajax({
      type: 'get',
      url : href,
      data: $(this).serialize
    }).done(function(response){
      $("#up_vote").replaceWith(response);
    });
  });

});
