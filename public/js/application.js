$(document).ready(function() {

  $(".up_vote").on("click", function(event){
    event.preventDefault();
    // var target = $(event.target)
    // debugger
    $.ajax({
      type: "POST",
      url : $(this).attr('href'),
      data: $(this).serialize()
    }).done(function(response){
    debugger
    //   $(target).replaceWith(response);
    }).fail(function(){
      alert("Your vote has not been cast!");
    });
  });

});
