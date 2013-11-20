Template.screen.message = ->
	getLastMessage()

window.getLastMessage = ->
	Messages.findOne({}, {sort: {date: -1}})

$ ->
	$(document).on "keyup", (e) ->
		console.log e.keyCode

		selected = "happy" if e.keyCode is 83
		selected = "medium_happy" if e.keyCode is 68
		selected = "indiferent" if e.keyCode is 70
		selected = "medium_sad" if e.keyCode is 71
		selected = "sad" if e.keyCode is 72

		console.log selected

		answer = {}
		id = getLastMessage()._id
		answer[selected] = 1
		Messages.update(id, {$inc: answer})

		///insert client information in database///
		today = new Date
		dd = today.getDate()
		mm = today.getMonth() + 1
		yyyy = today.getFullYear()
		hours = today.getHours()
		minutes = today.getMinutes()
		seconds = today.getSeconds()

		if ( dd < 10 )
			dd = '0' + dd 
		if ( mm < 10 )
			mm = '0' + mm
		if ( hours < 10 )
			hours = '0' + hours
		if ( minutes < 10 )
			minutes = '0' + minutes
		if ( seconds < 10 )
			seconds = '0' + seconds

		today = dd + '/' + mm + '/' + yyyy + " " + hours + ":" + minutes + ":" + seconds;

		History.insert { ip: "keyboard", choice: selected, timestamp: today }

		button = $("body")
		$("<div class='thanks' />").text("Obrigado pela opinião!").css({"background-color": "#FED753", color: "#09903F", "font-size": "30px", position:"absolute", left:button.width() / 2, top:button.height()}).appendTo($("body")).animate {top:"-=50",opacity:0}, 5000, ->
			this.remove()

		false