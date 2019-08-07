class BooksController < ApplicationController
  before_action :set_category_options, only: [:new, :create, :edit, :update, :index]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

   def index
      @books = Book.all.order("created_at desc")
   end
   
   def new
      @book = Book.new
   end

   def edit
   end   
   
   def create
      @book = Book.new(book_params)
      
      if @book.save
         redirect_to books_path, notice: "The book #{@book.title} has been saved."
      else
         render "new"
      end
      
   end

   def update
      respond_to do |format|
         if @book.update(book_params)
            format.html { redirect_to books_url, notice: 'Book was successfully updated.' }
            format.json { render :show, status: :ok, location: books_url}
         else
            format.html { render :edit }
            format.json { render json: @book.errors, status: :unprocessable_entity }
         end
      end
  end   
   
   def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path, notice:  "The book #{@book.title} has been removed."
   end
   
   private
      def set_category_options
         @category_options = ["Literatura", "Biografia", "Tecnologia", "Romance", "Fumec"]
      end

      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
      params.require(:book).permit(:title, :attachment, :author, :cover, :resume, :subtitle, :category)
   end
   
end
