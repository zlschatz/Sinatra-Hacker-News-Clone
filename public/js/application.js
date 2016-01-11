$(document).ready(function() {

  $(".up_vote").on("click", function(event){
    event.preventDefault();
    var target = $(event.target)
    $.ajax({
      type: "POST",
      url : target.attr('href'),
      data: $(this).serialize()
    }).done(function(response){
      $(target).replaceWith(response);
    }).fail(function(){
      alert("Your request has failed");
    });
  });

  $(".up_vote").on("click", function(event){
    event.preventDefault();
    $.ajax({
      type: "GET",
      url : $(event.target).attr('href'),
      data: $(this).serialize()
    }).done(function(response){
      $('body').replaceWith(response);
    });
  });

});
