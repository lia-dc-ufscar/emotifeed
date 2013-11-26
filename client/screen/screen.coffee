Template.screen.message = ->
	getLastMessage()

window.getLastMessage = ->
	Messages.findOne({}, {sort: {date: -1}})

Template.screen.com_date = ->
	today = new Date
	console.log today
	dd = today.getDate()
	mm = today.getMonth() + 1
	yyyy = today.getFullYear()

	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm

	today = dd + '/' + mm + '/' + yyyy

$ ->
	$(window).on "keydown", (e) ->
		return true if e.shiftKey || e.metaKey
		return true unless Session.get("current_page") == "screen"

		selected = ""
		selected = "happy" if e.keyCode is 83
		selected = "medium_happy" if e.keyCode is 68
		selected = "indiferent" if e.keyCode is 70
		selected = "medium_sad" if e.keyCode is 71
		selected = "sad" if e.keyCode is 72
		return true if _.isEmpty selected

		console.log selected

		answer = {}
		id = getLastMessage()._id
		answer[selected] = 1
		Messages.update(id, {$inc: answer})

		#insert client information in database#
		today = new Date
		dd = today.getDate()
		console.log dd
		mm = today.getMonth() + 1
		yyyy = today.getFullYear()
		hours = today.getHours()
		minutes = today.getMinutes()
		seconds = today.getSeconds()

		today = dd + '/' + mm + '/' + yyyy

		History.insert { ip: "keyboard", choice: selected, timestamp: today }

		button = $("body")
		$("<div class='thanks' />").text("Obrigado pela opinião!").css({"background-color": "#FED753", color: "#09903F", "font-size": "30px", position:"absolute", left:button.width() / 2, top:button.height()}).appendTo($("body")).animate {top:"-=50",opacity:0}, 5000, ->
			this.remove()

		false
