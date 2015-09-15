var LikeArticle = React.createClass({
  render: function() {
    if (this.state.isLiked) {
      return (
        <div onClick={this.handleClick}>
	  Un-like Me!
	</div>
      )
    } else {
      return (
        <div onClick={this.handleClick}>
	  Like Me!
	</div>
      )
    }
  },
  handleClick: function() {
    var method = this.state.isLiked ? "DELETE" : "POST";
    $.ajax({
      url: '/articles/' + this.props.articleID + "/likes",
      type: method,
      success: function(response) {
	this.setState({isLiked: response.liked});
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {isLiked: this.props.initialIsLiked};
  }
});
