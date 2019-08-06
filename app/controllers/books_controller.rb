class BooksController < ApplicationController
  before_action :set_category_options, only: [:new, :create, :edit, :update, :index]
   def index
      @books = Book.all.order("created_at desc")
   end
   
   def new
      @book = Book.new
   end
   
   def create
      @book = Book.new(book_params)
      
      if @book.save
         redirect_to books_path, notice: "The book #{@book.title} has been saved."
      else
         render "new"
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

      def book_params
      params.require(:book).permit(:title, :attachment, :author, :cover, :resume, :subtitle, :category)
   end
   
end
