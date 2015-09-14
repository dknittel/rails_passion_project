var AvailablePlayer = React.createClass({

	propTypes: {
	    player: React.PropTypes.object.isRequired,
	    viewCallback: React.PropTypes.func,
	    selectCallback: React.PropTypes.func
	},
	render: function () {
		return (
			<div key={this.props.player.id}>
				{this.props.player.name}
				<button>View Stats</button>
				<button onClick={this.props.selectCallback}>Select Player</button>
			</div>
			);
	}


});
