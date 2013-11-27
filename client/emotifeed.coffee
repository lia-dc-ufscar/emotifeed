Meteor.startup ->
	Session.set "logged", "false"
	window.router = new AppRouter
	Backbone.history.start pushState: true