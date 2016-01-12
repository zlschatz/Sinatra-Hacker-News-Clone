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
    $.ajax({
      type: "POST",
      url : $(this).attr('href'),
      dataType: "json",
    }).done(function(response){
      target.text(response.vote_count)
    }).fail(function(response){
      alert("Your vote has not been cast!");
    });
  });

  $("#add-comment").on("submit", function(event){
    event.preventDefault();
    debugger
    $.ajax({
      type : "POST",
      url  : $(event.target).attr('action'),
    }).done(function(response){
      debugger
      $("#comment-list").html(response);
    }).fail(function(response){
      alert("Something went wrong!");
    });
  });

});
