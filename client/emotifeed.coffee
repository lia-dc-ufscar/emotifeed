Meteor.startup ->
	window.router = new AppRouter
	Backbone.history.start pushState: true