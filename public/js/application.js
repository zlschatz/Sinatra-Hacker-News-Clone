$(document).ready(function() {

  $("#up_vote").on("click", function(event){
    event.preventDefault();
    $.ajax({
      type: 'get',
      url : $(event.target).attr('href'),
      data: $(this).serialize
    }).done(function(response){
      $("#up_vote").html(response);
    });
  });

});
