$(document).ready(function() {

  $(".up_vote").on("click", function(event){
    event.preventDefault();
    var vote_count = $(event.target).parent().parent().find('#vote_count')
    $.ajax({
      type: "POST",
      url : $(this).attr('href'),
      dataType: "json",
    }).done(function(response){
      vote_count.text(response.vote_count);
    }).fail(function(){
      alert("Your vote has not been cast!");
    });
  });

});
