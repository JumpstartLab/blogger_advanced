var CommentsForm = {
    createComment: function() {
        var commentData = {
            comment: {
                author_name: $("#comment_author_name").val(),
                body: $("#comment_body").val(),
                article_id: $("#comment_article_id").val()
            }
        }
        $.post("/comments",
               commentData,
               function(newCommentMarkup) {
                   $("#comments").append(newCommentMarkup);
                   $("#comment_author_name").val("");
                   $("#comment_body").val("");
               });
    },
    bindSubmitListener: function() {
        $("#new_comment").submit(function(event) {
            event.preventDefault();
            CommentsForm.createComment();
        });
    }
}

$(document).ready(CommentsForm.bindSubmitListener);
