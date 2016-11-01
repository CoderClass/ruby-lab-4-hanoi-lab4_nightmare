	window.updateMessagesViaJSON = function() {
		console.log("updateMessagesViaJSON run");
		var a = window.location.pathname + ".json"
		$.getJSON(a, function(messages){
			e = $('.messages')
			e.html('')
			for (i in messages) {
				e.append("<li class='list-group-item message'><strong>" + messages[i].name + " : </strong> " + messages[i].content + "</li>")
			}
		})
	}