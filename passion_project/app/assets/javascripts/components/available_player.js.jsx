var AvailablePlayer = React.createClass({

	propTypes: {
	    player: React.PropTypes.object.isRequired,
	    // viewCallback: React.PropTypes.func,
	    onSelect: React.PropTypes.func,
	    draft: React.PropTypes.any
	},
	onSelect: function(event){
		event.preventDefault();
		this.props.onSelect(this.props.player);
	},
	render: function () {
		var href = "/drafts/" + this.props.draft.id + "/players/" + this.props.player.id;
		return <div>
			{this.props.player.name}
			<button><a href={href}>View Stats</a></button>
			<button onClick={this.onSelect}>Select Player</button>
		</div>
	}


});
