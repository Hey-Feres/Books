/*
  Script that handle the interactions with book details modal.
  The UI is defined in _thumbnail.html.slim
*/

$(document).ready(function() {
  // Load Modal's Content
  $("a.open-book-details-modal").unbind("click").click(function() {
    const dataBook = $(this).attr("data-book")
    const book = JSON.parse(dataBook)
    const url = `/shelf_books/${book.id}`

    $.get(url)
    .then(response => setBookShelfButtonsColor(response))
    .catch(error   => console.log(error))

    setModalContent(book)
  })

  // On Modal Close
  $("#bookDetailsModal").on("hidden.bs.modal", function () {
    resetBookShelfButtonsColor()
  })

  // Add Book to a Shelf
  $(".add-book-shelf-button").unbind("click").click(function(event) {
    toggleLoader("show", this)

    const url = "/shelf_books/create"

    let data = {
      shelf_book: {
        book_id: $("#bookId").text(),
        type: $(this).data("type")
      }
    }

    $.post(url, data)
    .then(response => {
      setBookShelfButtonColor(this)
      toggleLoader("hide", this)
    })
    .catch(error => {
      console.log(error)
    })
  })
})

const setBookShelfButtonColor = el => {
  if ($(el).hasClass("white-button")) {
    $(el).removeClass("white-button")
    $(el).addClass("black-button")
  } else {
    $(el).removeClass("black-button")
    $(el).addClass("white-button")
  }
}

const setBookShelfButtonsColor = data => {
  $.each(data, function(_i, val) {
    $(`*[data-type=${val.type}]`).removeClass("white-button")
    $(`*[data-type=${val.type}]`).addClass("black-button")
  })
}

const setModalContent = book => {
  $("#bookCover").attr("src", book.cover.url)
  $("#bookTitle").text(book.title)
  $("#bookAuthor").text(book.author_name)
  $("#bookResume").text(book.resume)
  $("#bookDownload").attr("href", book.attachment.url)
  $("#shareModalLabel").text(`Compartilhar ${book.title}`)
  $("#bookId").text(book.id)
}

const resetBookShelfButtonsColor = () => {
  $.each($(".add-book-shelf-button"), function() {
    $(this).removeClass("black-button")
    $(this).addClass("white-button")
  })
}

const toggleLoader = (toggleType, el) => {
  if (toggleType == "show") {
    $(el).children("i").hide()
    $(el).children(".loader").show()
  } else {
    $(el).children(".loader").hide()
    $(el).children("i").show()
  }
}
