Sun:
(done) Sort players by points in drafts#show controller
(done)Display logout and 'is picking' with react
(done) Display view_stats and select player buttons on page with react
Post to database with ajax
Remove selected players with react

Mon:
Update 'is picking' with react
Display finish draft button with react
Get view_stats button working with react(?)
Logout link button
Display complete page with react or just normal button link

After 6:
Prep what to say
Clean up code
Create video

api/v1/drafts/:id
@draft.to_json with options to send everything from rails to js
	get an array of undrafted players with hashes of their id and name
	get an array of teams with their name, id, and an array of their current players
	have something to determine the current team

once you have all that, create the user interface with react using that data
then use react to select players
Use unmount to remove players from the page

Fix login and register authentication and errors
See notes from sinatra version
