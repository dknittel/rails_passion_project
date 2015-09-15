var Drafts = React.createClass({
	propTypes:{
		available_players: React.PropTypes.array.isRequired,
		current_team:      React.PropTypes.any,
		picking_team:      React.PropTypes.any,
		full_teams:        React.PropTypes.any,
		draft:             React.PropTypes.any,
	},

	removePlayer: function(player) {
		var available_players = this.props.available_players
		var index = available_players.indexOf(player);
		available_players = available_players.splice(index, 1);
		this.forceUpdate();
	},

	selectPlayer: function(player) {
		this.removePlayer(player);
		console.log('selected player',player)
		$.ajax({
			method: 'put',
			url: '/drafts/'+this.props.draft.id, 	
			data: {player_id: player.id},
		})
		// if (this.props.full_teams) {
		// 	return <EndDraft />;
		// }
    },

	render: function () {
		return <AvailablePlayerList players={this.props.available_players} onSelect={this.selectPlayer} draft={this.props.draft}/>;
	},
});












var EndDraft = React.createClass({
	render: function () {
		return (
			<a href={"/drafts/" + this.props.draft.id + "/draftees"}>Draft Complete</a>
			);
	}
})









// var CurrentTeam = React.createClass({
// 	getInitialState: function () {
// 		console.log('yo')
// 		console.log(JSON.parse(this.props.presenter));
// 		return JSON.parse(this.props.presenter);
// 	},

// 	render: function () {
// 				console.log(this.state.picking_team.name);
// 		return (
// 				<div>{this.state.picking_team.name} is picking</div>
// 			)
// 	}
// });

// var LogoutButton = React.createClass({
// 	render: function () {
// 		return (
// 				<button>Logout</button>
// 			)
// 	}
// });

// // React.render(
// //   <LogoutButton />,
// //   document.getElementById('logout')
// // );

// var PlayerList = React.createClass({

// 	propTypes:{
// 		playerList: React.PropTypes.array.isRequired,
// 		selectCallback: React.PropTypes.func.isRequired
// 	}

//     render: function(){
//     	var players = this.props.playerList.map(function(player, index){
//     		return <PlayerListMember key={index} player={player} />
//     	});

//         var that = this;
//         var displayTask  = function(player, playerIndex){     
//           console.log(that,"NEW ADDED TASK",player);
//           return (
//             <div key={playerIndex}>
//               <AvailablePlayerList onClick={that.props.selectPlayer} value={playerIndex} />
//             </div>);
//           };
//    }
//  });









// // var TaskApp = React.createClass({
// //     getInitialState: function(){
// //         return JSON.parse(this.props.presenter);
// //     },
    
// //     deleteTask: function(e) {
// //         var taskIndex = parseInt(e.target.value, 10);
// //         console.log('remove task: %d', taskIndex, this.state.items[taskIndex]);
// //         this.setState(state => {
// //             state.items.splice(taskIndex, 1);
// //             return {items: state.items};
// //         });
// //     },

// //     render: function(){ 
// //         return(
// //             var playerNodes = this.state.available_players.map(function (player) {
// // 					console.log(this.props)
// // 				return (
// // 					<div>
// // 					{player.name}
// // 					<button>View Stats</button>
// // 					<button>Select Player</button>
// // 					</div>
// // 					);
// // 			});
// // 			console.log('rendering');
// // 			return(
// // 				<div>{playerNodes}</div>
// // 				);
// //         );
// //     }
// // });

// // var DataList = React.createClass({
// // 	render: function(){
    
// //         var displayTask  = function(task, taskIndex){
// //             console.log("NEW ADDED TASK"+task);
    
// // 					console.log(this.props)
// //             return (
// // 					<div>
// // 					{player.name}
// // 					<button>View Stats</button>
// // 					<button onClick={this.deleteElement}>View Stats</button>
// // 					</div>
// // 					);
// //         };
    
// //         return <ul>
// //             {this.props.items.map((task, taskIndex) => 
// //                 <li key={taskIndex}>
// //                     {task}
// //                     <button onClick={this.props.deleteTask} value={taskIndex}> Delete </button>
// //                 </li>
// //             )}
// //         </ul>;
// //     }
// // })






// // var GetData = React.createClass({
// // 	getInitialState: function () {
// // 		// console.log(JSON.parse(this.props.presenter));
// // 		return JSON.parse(this.props.presenter);
// // 	},

// // 		// getPlayerData: function ( formData, action ) {
// // 		// 	console.log(formData)
// // 		// 		$.ajax({
// // 		// 			data: formData,
// // 		// 			url: action,
// // 		// 			type: "post",
// // 		// 			dataType: "json",
// // 		// 			success: function ( data ) {
// // 		// 				console.log(data)
// // 		// 				this.setState({ available_players: data });
// // 		// 			}.bind(this)
// // 		// 		});
// // 		// },

// // 		render: function () {
// // 			// console.log(this.state.available_players)
// // 			var playerNodes = this.state.available_players.map(function (player) {
// // 				return (
// // 					<div>
// // 					{player.name}
// // 					<button>View Stats</button>
// // 					console.log(this.props)
// // 					// <button id="select-player" onClick={this.props.clickHandler}>Select Player</button>
// // 					</div>
// // 					// <Comment author={comment.author}>
// // 					// {comment.text}
// // 					// </Comment>
// // 					);
// // 			});
// // 			console.log('rendering');
// // 			// debugger
// // 			return(
// // 				<div>{playerNodes}</div>
// // 				// <div> {this.state.available_players.name}	 </div>
// // 				// for(var i = 0; i < @presenter.available_players.length(); ++i) {
// // 				// 	<li>{this.state.available_players[i].name}</li>
// // 				// }
// // 				);
// // 		},
// // 		// render: function() {
// // 		// 	return (
// // 	 //    <div>{img}<GetData clickHandler={this.removeImage} /></div>
// // 	 //    );
// // 		// }
// // 	});


// // var RemovePlayer = React.createClass({
// //   render: function() {
// //     var player = this.state.showImage ? <GetData /> : '';
// //     return (
// //     <div>{player}<GetData clickHandler={this.removeImage} /></div>
// //     );
// //   },

// //   getInitialState: function() {
// //       return {
// //           showImage: true
// //       };
// //   },

// //   removeImage: function() {
// //       this.setState({ showImage: false });
// //   }
// // });

// // var selectPlayer = React.createClass({


// // })




// // var GetData = React.createClass({
// //   getInitialState: function() {
// // 	console.log('yo')
// //     return {
// //       available_players: [],
// //       current_team: [],
// //       team: ''
// //     };
// //   },

// //   // componentWillMount: function() {
// //   // 	console.log('mounting');
// //   // },

// //   componentDidMount: function() {
// //     $.get(this.props.source, function(result) {
// //   	console.log('mounted')
// //     console.log(result)
// //       var lastGist = result[0];
// //       if (this.isMounted()) {
// //         this.setState({
// //           username: lastGist.owner.login,
// //           lastGistUrl: lastGist.html_url
// //         });
// //       }
// //     }.bind(this));
// //   },

// //   render: function() {
// //   	console.log('rendering')
// //     return (
// //       <div>
// //         {this.state.username}
// //         <a href={this.state.lastGistUrl}>here</a>.
// //       </div>
// //     );
// //   }
// // });

// // React.render(
// //   <GetData source='https://localhost:3000/drafts/2' />,
// //   // mountNode
// //   document.getElementById('current-team')
// // );






// // $(document).ready(function() {

// // 	// $(document).load('/drafts/:id', $(this).serialize(), function(){
// // 	// 	var data = $(this).serialize();
// // 	// })

// 	// var data;
// 	// $('.select-player').on("click", function(event) {
// 	// 	event.preventDefault();
// 	// 	console.log($(this).serialize());
// 	// 	var getData = $.ajax({
// 	// 		method: 'get',
// 	// 		url: $(document).attr("href"),
// 	// 		data: $(document).serialize(),
// 	// 		dataType: 'json'
// 	// 	});
// 	// 	getData.done(function(response){
// 	// 		console.log("it worked");
// 	// 		console.log(response);
// 	// 		data = response;	
// 	// 	})
// 	// 	getData.fail(function(response){
// 	// 		console.log("it didn't work");
// 	// 		console.log(response);
// 	// 	})
// 	// })

// // });



// // var items;

// // $.getJSON( $(this).attr("href"), function( data ) {
// // 	console.log(data)
// //   items = [];
// //   $.each( data, function( key, val ) {
// //     items.push( "<li id='" + key + "'>" + val + "</li>" );
// //   });
// // console.log(items);
// // 	var CurrentTeam = React.createClass({
// // 		render: function () {
// // 			return (<h3>is picking</h3>);
// // 		}
// // 	});

// // 	React.render(
// // 	  <CurrentTeam />,
// // 	  document.getElementById('current-team')
// // 	);
// // })

