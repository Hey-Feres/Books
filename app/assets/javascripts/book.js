class Book {
  constructor(totalPages, bookdId, startingPage) {
    this.totalPages = totalPages
    this.bookdId = bookdId
    this.startingPage = startingPage || 0
    this.loadedPages = []
    this.currentPage = 1
    this.percentageRead = 0
  }

  calculatePercentageRead() {
    return ((this.currentPage / this.totalPages) * 100).toFixed() 
  }

  fetchPages(offset, skipUiUpdate) {
    offset ||= startingPage
    const params = `book_id=${bookdId}&offset=${offset}`
    const url = `load_pages?${params}`

    $.get(url)
    .then((response) => {
      this.loadedPages = this.loadedPages.concat(response)
      this.currentPage = 1

      if(skipUiUpdate) return

      $("#leftPage").text(this.loadedPages[0].content)
      $("#rightPage").text(this.loadedPages[1].content)
      $("#percentageRead").text( `${this.calculatePercentageRead()}%` )
      $("#paginationNumber").text( `${this.currentPage}/${this.totalPages}` )
    })
    .catch((error) => {
      alert("Não foi possível carregar o livro")
    })
  }

  advancePage() {
    if (this.currentPage + 2 >= this.loadedPages.length) {
      this.fetchPages(this.loadedPages[this.loadedPages.length-1].number)
    }
    $("#leftPage").text(this.loadedPages[this.currentPage+1].content)
    $("#rightPage").text(this.loadedPages[this.currentPage+2].content)
    this.currentPage = this.currentPage + 2
    $("#percentageRead").text( `${this.calculatePercentageRead()}%` )
    $("#paginationNumber").text( `${this.currentPage}/${this.totalPages}` )
  }

  backPage() {
    $("#leftPage").text(this.loadedPages[this.currentPage-2].content)
    $("#rightPage").text(this.loadedPages[this.currentPage-1].content)
    this.currentPage = this.currentPage - 2
    $("#percentageRead").text( `${this.calculatePercentageRead()}%` )
    $("#paginationNumber").text( `${this.currentPage}/${this.totalPages}` )
  }
}