var ArticleList = React.createClass({
  articleComponents: function() {
    var list = this;
    return this.state.articles.map(function(a) {
      return (
	<Article
	article={a}
	deleteHandler={list.deleteArticle}
	key={"article-" + a.id}
	/>
      )
    });
  },
  deleteArticle: function(articleID) {
    $.ajax({
      url: "/articles/" + articleID,
      type: "DELETE",
      success: function() {
	var updatedList = this.state.articles.filter(function(a) {
	  return a.id !== articleID;
	});
	this.setState({articles: updatedList});
      }.bind(this)
    })
  },
  render: function() {
    return(
      <ul id="articles">
      {this.articleComponents()}
      </ul>
    );
  },
  getInitialState: function() {
    return { articles: this.props.articles };
  }
});