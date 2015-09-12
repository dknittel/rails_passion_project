var Welcome = React.createClass({
	render: function () {
		return (<h1>Welcome to Fantasy Sports Draft</h1>);
	}
});

React.render(
  <Welcome />,
  document.getElementById('welcome')
);

var LoginButton = React.createClass({
  render: function() {
    return (
      <div>
        <a className="waves-effect waves-light btn" href="/login">Login</a>
      </div>
    );
  }
});

React.render(
  <LoginButton />,
  document.getElementById('content')
);

var RegisterButton = React.createClass({
  render: function() {
    return (
      <div >
        <a className="waves-effect waves-light btn" href="/signup" class="button">Register</a>
      </div>
    );
  }
});

React.render(
  <RegisterButton />,
  document.getElementById('content2')
);


// var Input = React.createClass({
// 	render: function() {
// 		return (
// 			<input type="text" name="name"/>
// 			);
// 	}
// });

// var Button = React.createClass({
// 	render: function() {
// 		return (
// 			<button>asdf</button>
// 			);
// 	}
// });


// var CommentBox = React.createClass({
//   render: function() {
//     return (
//       <div className="commentBox">
//         Hello, world! I am a CommentBox.
//       </div>
//     );
//   }
// });
// React.render(
//   <CommentBox />,
//   document.getElementById('content')
// );


// var React = require('react');

// var input = <input type="checkbox" />


