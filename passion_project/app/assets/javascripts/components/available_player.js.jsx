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
		// debugger;
		return <div>
			{this.props.player.name}
			<button><a href='/drafts/'+this.props.draft.id+'/draftees'>View Stats</a></button>
			<button onClick={this.onSelect}>Select Player</button>
		</div>
	}


});
