$(document).ready(function() {

  $("#news-feed").on("click", ".up_vote", function(event){
    event.preventDefault();

    // Put the ID that you need to access on the classes or id's if the div
    // you need to update. Then return that id in the json and just directly,
    // access it with the selector $('vote_count post-'+ resonse.post_id ).text()
    var vote_count = $(event.target).parent().parent().find('#vote_count');
    debugger
    $.ajax({
      type: "POST",
      url : $(this).attr('href'),
      dataType: "json",
    }).done(function(response){
      debugger
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
    $.ajax({
      type : "POST",
      url  : $(event.target).attr('action'),
      data : $(this).serialize()
    }).done(function(response){
      $("#content").val('')
      $("#comment-list").append(response);
    }).fail(function(response){
      alert("Your comment is unable to be posted!");
    });
  });

});
