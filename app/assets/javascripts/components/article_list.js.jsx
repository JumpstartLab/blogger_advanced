var ArticleList = React.createClass({
  articleComponents: function() {
    return this.props.articles.map(function(a) {
      return (
	<Article
	article={a}
	key={"article-" + a.id}
	/>
      )
    });
  },
  render: function() {
    return(
      <ul id="articles">
      {this.articleComponents()}
      </ul>
    );
  }
});