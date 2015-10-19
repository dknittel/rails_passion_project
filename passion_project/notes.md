Display complete page with react or just normal button link

Update 'is picking' with react

Logout link button

Use react to do the view stats

Display finish draft button with react

Put 'loading' on create teams page while drafts page loads

Fix login and register authentication and errors

Current team so far

See notes from sinatra version





api/v1/drafts/:id
@draft.to_json with options to send everything from rails to js
	get an array of undrafted players with hashes of their id and name
	get an array of teams with their name, id, and an array of their current players
	have something to determine the current team

once you have all that, create the user interface with react using that data
then use react to select players
Use unmount to remove players from the page
