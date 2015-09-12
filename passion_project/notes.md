api/v1/drafts/:id
@draft.to_json with options to send everything from rails to js
	get an array of undrafted players with hashes of their id and name
	get an array of teams with their name, id, and an array of their current players
	have something to determine the current team

once you have all that, create the user interface with react using that data
then use ajax to select players just like you did in sinatra