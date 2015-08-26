console.log("hi there");

// Make our comment form submit via ajax
//
// ___CLIENT SIDE___
// [X] listen to button click or form submission
// [X] read values from the form fields (author name, body, article id)
// - post to the endpoint on the server (probably using $.post)
// - When the server responds, we need to add the new comment
//   to the UI (hopefully do this in a way that matches all the
//   other comments)
//
// ___SERVER SIDE__
//
// - create action needs to take posted data
// - create the record
// - return some response (JSON? HTML?)

function submitComment(event) {
  console.log("event!");
  event.preventDefault();
  console.log(commentData());
  console.log("hi u submitted");
}

function commentData() {
  return { body: $("#comment_body").val(),
           article_id: $("#comment_article_id").val(),
           author_name: $("#comment_author_name").val()
         };
}

// {body: "the body from the form",
// article_id: "the article id from the form",
// author_name: "the author name from the form"
// }

$(document).ready(function() {
  $("#new_comment").submit(submitComment);
});
