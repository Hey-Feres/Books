class Book {
  constructor(number_of_pages) {
    this.number_of_pages = number_of_pages
  }

  addPage (page, book) {
    alert(page)
    // First check if the page is already in the book
    if (!book.turn('hasPage', page)) {
      console.log("******")
      console.log(page)

      // Create an element for this page
      var element = $('<div/>', {
        'class': 'page '+((page%2==0) ? 'odd' : 'even'), 'id': 'page-'+page
      }).html('<i class="loader"></i>')

      // If not then add the page
      book.turn('addPage', element, page)

      let starting_at = 15

      $.ajax({
        method: "GET",
        url: `load_pages/${starting_at}`,
      })
      .done(function(data){
        console.log(data)
        element.html(
          `<div class='book-page'>
            <p> ${data[0].page_content} </p>
          </div>`
        )

        $('.loading-book').hide()
      })
      .fail(function(x,y,z){
        console.log(x)
      })
    }
  }



}

// === Docs === //
//
// * Function addPage
//   - Description
//     Adds the pages that the book will need
//   - Parameters
//     - page
//       The number of the page, it comes from 2 and 2
//     - book
//       The html element to append pages



