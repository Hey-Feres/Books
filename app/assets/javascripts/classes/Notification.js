class	Notification {
	call(title, text) {
		this.add(title, text)
		this.remove()
	}

  build(){
  	const notificationStructure = `<div class='notification'><p class="title"></p><p class="text"></p></div>`
  	$("body").append(notificationStructure);
  }

  add(title, text){
  	this.build()

	  $(".notification p.title").text(title)
	  $(".notification p.text").text(text)
	  $(".notification").animate("slideInRight")
	  $(".notification").show()
  }

  remove(){
	  setTimeout(function() {
	    $(".notification").animate("slideOutRight")

	    setTimeout(function() {
	      $("div.notification").remove();
	    }, 700)
	  }, 3000)
  }
}
