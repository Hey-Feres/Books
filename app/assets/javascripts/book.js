class Book {
  constructor(number_of_pages) {
    this.number_of_pages = number_of_pages;
  }

  // Adds the pages that the book will need
  addPage (page, book) {
    //   First check if the page is already in the book
    if (!book.turn('hasPage', page)) {
      console.log("******")
      console.log(page)
      // Create an element for this page
      var element = $('<div/>', {'class': 'page '+((page%2==0) ? 'odd' : 'even'), 'id': 'page-'+page}).html('<i class="loader"></i>');
      // If not then add the page
      book.turn('addPage', element, page);

      let starting_at = 15

      $.ajax({
        method: "GET",
        url: `load_pages/${starting_at}`,
      })
      .done(function(data){
        console.log(data)
        element.html('<div class="book-page"> <p style="font-size: 13px; text-align: justify">'+data[0].page_content+'</p></div>');
        $('.loading-page').hide()
      })
      .fail(function(x,y,z){
        console.log(x)
      })

    }
  }
}
