$(document).ready(function() {
  $("a.open-book-details-modal").unbind("click").click(function() {
    let book = JSON.parse($(this).attr("data-book"))
    $("#bookCover").attr("src", book.cover.url)
    $("#bookTitle").text(book.title)
    $("#bookAuthor").text(book.author_name)
    $("#bookResume").text(book.resume)
    $("#bookDownload").attr("href", book.attachment.url)
    $("#shareModalLabel").text(`Compartilhar ${book.title}`)

    // WIP
    setTimeout(function(){
      $(".add-book-shelf-button:visible").each(function(index){
        // $(".add-book-shelf-button")[index].attr("data-book-id", book.id)
        console.info($(this))
      })
    }, 300);
  })
})
