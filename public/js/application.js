$(document).ready(function() {

  $("#news-feed").on("click", ".up_vote", function(event){
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

  $("#comment-container").on("click", ".up_vote", function(event){
    event.preventDefault();
    var target = $(event.target).parent().find("#vote_count")
    // debugger
    $.ajax({
      type: "POST",
      url : $(this).attr('href'),
      dataType: "json",
    }).done(function(response){
      debugger
      target.text(response.vote_count)
    }).fail(function(response){
      alert("Your comment cannot be posted");
    });
  });

});
