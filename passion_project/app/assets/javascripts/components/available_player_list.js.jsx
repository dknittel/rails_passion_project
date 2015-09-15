var AvailablePlayerList = React.createClass({

	propTypes: {
		players: React.PropTypes.array.isRequired,
	    onSelect:   React.PropTypes.func,
	    draft: React.PropTypes.any

	},
	render: function () {
		var onSelect = this.props.onSelect;
		var that = this;
		var players = this.props.players.map(function(player, index){
    		return <AvailablePlayer key={index} player={player} onSelect={onSelect} draft={that.props.draft}/>
    	});

		return <div>{players}</div>;
	}
});

