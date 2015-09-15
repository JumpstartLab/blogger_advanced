var Article = React.createClass({
  url: function() {
    return "/articles/" + this.props.article.id;
  },
  editUrl: function() {
    return this.url() + "/edit";
  },
  deleteHandler: function() {
    this.props.deleteHandler(this.props.article.id);
  },
  render: function() {
    return (
      <li>
      <a href={this.url()}>
        {this.props.article.title}
      </a>
      <span className="tag_list">
        {this.props.article.tag_list}
      </span>
      <span className="actions">
        <a href={this.editUrl()}>
          <img src="/assets/page_edit.png" />
        </a>
        <a href="#" onClick={this.deleteHandler}>
          <img src="/assets/cancel.png" />
        </a>
      </span>
      <LikeArticle
        articleID={this.props.article.id}
        initialIsLiked={this.props.article.liked}
        />
      <span>
        {this.props.article.comments_count + " Comments"}
      </span>
      </li>
    )
  }
});