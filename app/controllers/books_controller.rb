class BooksController < ApplicationController
  before_action :set_category_options, only: [:new, :create, :edit, :update, :index]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

   def index
      @books = Book.all.order("created_at desc")
      @biografias = Book.where("category = 'Biografia'")
      @literaturas = Book.where("category = 'Literatura'")
   end

   def show
   end      
   
   def new
      @book = Book.new
   end

   def edit
   end   
   
   def create
      @book = Book.new(book_params)
      
      if @book.save
         redirect_to books_path, notice: "O livro #{@book.title} foi salvo. Obrigado :)"
      else
         render "new"
      end
      
   end

   def update
      respond_to do |format|
         if @book.update(book_params)
            format.html { redirect_to books_url, notice: "O livro #{@book.title} foi atualizado. Obrigado :)" }
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
      redirect_to books_path, notice:  "O livro #{@book.title} foi removido!"
   end
   
   private
      def set_category_options
         @category_options = ["Literatura", "Biografia", "Tecnologia", "Romance", "Ficção"]
      end

      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
      params.require(:book).permit(:title, :attachment, :author, :cover, :resume, :subtitle, :category)
   end
   
end
