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
    });
  });

  // $(".up_vote").on("click", function(event){
  //   event.preventDefault();
  //   $.ajax({
  //     type: "GET",
  //     url : $(event.target).attr('href'),
  //     data: $(this).serialize()
  //   }).done(function(response){
  //     debugger
  //     $('body').replaceWith(response);
  //   });
  // });

});
