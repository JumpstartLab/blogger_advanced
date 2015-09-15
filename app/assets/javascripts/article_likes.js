var Hello = React.createClass(
  {
    render: function() {
      console.log(this.props)
      return React.createElement("div", null,
				 React.createElement("p", null, React.createElement("span", null, "hello")))
    }
  }
);

var LikeArticle = React.createClass({
  clickHandler: function() {
    this.setState({isLiked: !this.state.isLiked});
  },
  fetchNewArticleData: functio() {
  },
  render: function() {
    console.log(this.state);
    if (this.state.isLiked) {
      return React.createElement("div", {onClick: this.clickHandler }, "Un-Like Me!")
    } else {
      return React.createElement("div", {onClick: this.clickHandler }, "Like Me!")
    }
  },
  getInitialState: function() {
    return {isLiked: this.props.initialIsLiked};
  }
});

$(document).ready(function() {
  $(".like-article").each(function(index, element) {
    var props = {
      initialIsLiked: $(element).data("initial-is-liked")
    }
    React.render(
      React.createElement(LikeArticle,
			  props),
      element
    )
  });
});

