var hello = function () { console.log("Hello, Tuesday!") };

var addCount = function(){
  jQuery.getJSON( '/api/v1/articles/count', function(articleCount){
    appendCount(articleCount);
  });
};

var appendCount = function(count){
  jQuery("#articles-count").text(" (" + count + ")");
};

jQuery(document).ready(function(){
  addCount();
  // var articleCounter = window.setInterval(addCount, 2000);
});

var recentArticles = function(){
  jQuery.getJSON( '/api/v1/articles', function(articlesData){
    $.each(articlesData, function(index, article){
      var list_item_id = "article_" + article.id

      if($('#' + list_item_id).length == 0){
        var list_item = "<li id='" + list_item_id + "'><a href='/articles/" + 
        article.id + "'>" + article.title + "</a></li>";
        $('ul#articles').prepend(list_item);
      } else {
        console.log("Article with ID " + article.id + " already present.")
      };
    });
  });
};

// var articleAdder = window.setInterval(recentArticles, 2000);
