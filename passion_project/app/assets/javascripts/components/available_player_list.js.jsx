var AvailablePlayerList = React.createClass({

	propTypes: {
		playerList: React.PropTypes.array.isRequired,
	    selectCallback: React.PropTypes.func

	},
	render: function () {
			debugger;
			var callback = this.props.selectCallback
		return (
			<div key={1}>
			{this.props.playerList.map(function(player){
				return(<AvailablePlayer selectCallback={callback} player={player}/>);
			})}
			</div>
		);
	}
});

