var Article = React.createClass({
  url: function() {
    return "/articles/" + this.props.article.id;
  },
  editUrl: function() {
    return this.url() + "/edit";
  },
  render: function() {
    return (
      <li>
      <a href={this.url()}>
        {this.props.article.title}
      </a>
      <span className="tag_list">
        {this.props.tagList}
      </span>
      <span className="actions">
        <a href={this.editUrl()}>
          <img src="/assets/page_edit.png" />
        </a>
      </span>
      <LikeArticle
        articleID={this.props.article.id}
        initialIsLiked={this.props.article.liked}
        />
      <span>
        {this.props.commentsCount}
      </span>
      </li>
    )
  }
});