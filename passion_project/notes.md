Sun:
(done) Sort players by points in drafts#show controller
(done)Display logout and 'is picking' with react
(done) Display view_stats and select player buttons on page with react

Morning:
(done)Post to database with ajax 

Afternoon: (teacher help)
(done)Remove selected players with react

Afternoon/night:
Get full teams working
Display teams?
Get view_stats button working (with react?) (afternoon/night)

If time:
(skip?)Display complete page with react or just normal button link
(just remove is picking and logout button for now) Update 'is picking' with react
(skip?) Logout link button
(skip) Display finish draft button with react
fix register and login

When home (stay up as late as you need):
Prep what to say (30 min)
Clean up code (10 min)
Create video (40 min)

api/v1/drafts/:id
@draft.to_json with options to send everything from rails to js
	get an array of undrafted players with hashes of their id and name
	get an array of teams with their name, id, and an array of their current players
	have something to determine the current team

once you have all that, create the user interface with react using that data
then use react to select players
Use unmount to remove players from the page

Put 'loading' on create teams page while drafts page loads
Fix login and register authentication and errors
See notes from sinatra version
