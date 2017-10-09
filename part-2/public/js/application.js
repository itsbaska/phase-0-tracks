$(document).ready(function(){
  $("#post_form").on("submit", createPostHandler);
  $(".post_like").on("submit",likeHandler);
});

  var createPostHandler = function(event){
    event.preventDefault();

    $form = $(this);

    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response) {
      $("#posts").append(response);
      $form.trigger("reset");
    });
  };

  var likeHandler = function(event){
    event.preventDefault();
    $like = $(this);

    var url = $like.attr("action");
    var method = $like.attr("method");
    var data = $like.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response) {
      $(".like_count").text(response);
    });
  };

