/*
  Script that handle the interactions with book details modal.
  The UI is defined in _thumbnail.html.slim
*/

$(document).ready(function() {
  // Load Modal's Content
  $("a.open-book-details-modal").unbind("click").click(function() {
    loadBookDetails(this)
  })

  // On Modal Close
  $("#bookDetailsModal").on("hidden.bs.modal", function () {
    resetBookShelfButtonsColor()
  })

  // Add Book to a Shelf
  $(".add-book-shelf-button").unbind("click").click(function(event) {
    runBookShelfRequest(this)
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

const displayLoadError = () => {
  $(".modal-content.load-error").css("display", "flex")
  $(".modal-content.load-success").css("display", "none")
}

const loadBookDetails = (dataBookEl) => {
  const dataBook = $(dataBookEl).attr("data-book")
  const book = JSON.parse(dataBook)
  const url = `/shelf_books/${book.id}`

  $.get(url)
  .then((response) => {
    setBookShelfButtonsColor(response)
    setModalContent(book)
  })
  .catch((error) => {
    displayLoadError()
  })
}

const runBookShelfRequest = (el) => {
  toggleLoader("show", el)

  const isCreateRequest = $(el).hasClass("white-button")
  const url = "/shelf_books/create_or_destroy"
  const data = {
    shelf_book: {
      book_id: $("#bookId").text(),
      type: $(el).data("type")
    }
  }

  $.post(url, data)
  .then(response => {
    setBookShelfButtonColor(el)
    toggleLoader("hide", el)
    if (isCreateRequest){
      showNotification("Sucesso!", "Livro Adicionado a sua Estante.")
    } else {
      showNotification("Sucesso!", "Livro Removido da sua Estante.")
    }
  })
  .catch(error => {
    toggleLoader("hide", el)
    runErrorAnimation(el)
    showNotification("Algo Deu Errado", "Não foi possivel adicionar o livro a sua estante.")
  })
}
