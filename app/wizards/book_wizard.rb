class BookWizard
	def initialize(book_id:)
		@book = Book.find book_id
	end

	def get_pages(screen_width:,starting_page:)
		content = @book.parsed_content

    chars_per_page = screen_width * 1.7
    pagesContents = []

    # First page
    pagesContents << content[(starting_page * chars_per_page)..-1].truncate(chars_per_page, separator: ' ', omission: '')
    last_page = starting_page
	end
end