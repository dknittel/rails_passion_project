var GetData = React.createClass({
	getInitialState: function () {
		// console.log(JSON.parse(this.props.presenter));
			return JSON.parse(this.props.presenter);
		},

		// getPlayerData: function ( formData, action ) {
		// 	console.log(formData)
		// 		$.ajax({
		// 			data: formData,
		// 			url: action,
		// 			type: "post",
		// 			dataType: "json",
		// 			success: function ( data ) {
		// 				console.log(data)
		// 				this.setState({ available_players: data });
		// 			}.bind(this)
		// 		});
		// },

		render: function () {
			console.log('rendering');
			// debugger
			console.log(this.state.available_players);
			return (
				    

				for(var i = 0; i < @presenter.available_players.length(); ++i) {
					<li>available_players[i]</li>
				}
				);
		}
	});




// var GetData = React.createClass({
//   getInitialState: function() {
// 	console.log('yo')
//     return {
//       available_players: [],
//       current_team: [],
//       team: ''
//     };
//   },

//   // componentWillMount: function() {
//   // 	console.log('mounting');
//   // },

//   componentDidMount: function() {
//     $.get(this.props.source, function(result) {
//   	console.log('mounted')
//     console.log(result)
//       var lastGist = result[0];
//       if (this.isMounted()) {
//         this.setState({
//           username: lastGist.owner.login,
//           lastGistUrl: lastGist.html_url
//         });
//       }
//     }.bind(this));
//   },

//   render: function() {
//   	console.log('rendering')
//     return (
//       <div>
//         {this.state.username}
//         <a href={this.state.lastGistUrl}>here</a>.
//       </div>
//     );
//   }
// });

// React.render(
//   <GetData source='https://localhost:3000/drafts/2' />,
//   // mountNode
//   document.getElementById('current-team')
// );






// $(document).ready(function() {

// 	// $(document).load('/drafts/:id', $(this).serialize(), function(){
// 	// 	var data = $(this).serialize();
// 	// })

	// var data;
	// $('.select-player').on("click", function(event) {
	// 	event.preventDefault();
	// 	console.log($(this).serialize());
	// 	var getData = $.ajax({
	// 		method: 'get',
	// 		url: $(document).attr("href"),
	// 		data: $(document).serialize(),
	// 		dataType: 'json'
	// 	});
	// 	getData.done(function(response){
	// 		console.log("it worked");
	// 		console.log(response);
	// 		data = response;	
	// 	})
	// 	getData.fail(function(response){
	// 		console.log("it didn't work");
	// 		console.log(response);
	// 	})
	// })

// });



// var items;

// $.getJSON( $(this).attr("href"), function( data ) {
// 	console.log(data)
//   items = [];
//   $.each( data, function( key, val ) {
//     items.push( "<li id='" + key + "'>" + val + "</li>" );
//   });
// console.log(items);
// 	var CurrentTeam = React.createClass({
// 		render: function () {
// 			return (<h3>is picking</h3>);
// 		}
// 	});

// 	React.render(
// 	  <CurrentTeam />,
// 	  document.getElementById('current-team')
// 	);
// })
