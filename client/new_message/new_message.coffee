Template.new_message.events =
	"click a[name=post]": ->
		content = $('textarea[name=message]').val().split("\n").join("<br/>")
		if ( content != "" )
			Messages.insert {content: content, happy: 0, medium_happy: 0, indiferent: 0, medium_sad: 0, sad: 0, date: new Date}
		else
			button = $("#post")
			console.log button
			$("<div class='thanks' />").text("Erro: digite o conteúdo da mensagem!").css({position:"absolute", left:button.offset().left - 30, top:button.offset().top - 30}).appendTo($("body")).animate {top:"-=50",opacity:0}, 8000, ->
				this.remove()

Template.new_message.com_date = ->
	today = new Date
	dd = today.getDate()
	mm = today.getMonth() + 1
	yyyy = today.getFullYear()

	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm

	today = dd + '/' + mm + '/' + yyyy