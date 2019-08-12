class BooksController < ApplicationController
  before_action :set_category_options, only: [:new, :create, :edit, :update, :index]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

   def index
      @books = Book.all.order("created_at desc")
      
      @recente = Book.all.order("created_at desc").limit(4)
      @recenteAll = Book.all.order("created_at desc")

      @biografia = Book.where("category = 'Biografia'").limit(4)
      @biografiaAll = Book.where("category = 'Biografia'")

      @literatura = Book.where("category = 'Literatura'").limit(4)
      @literaturaAll = Book.where("category = 'Literatura'")

      @filosofia = Book.where("category = 'Filosofia'").limit(4)
      @filosofiaAll = Book.where("category = 'Filosofia'")      
   end

   def show
   end 

   def show_all        
      @all = Book.where("category = '#{params[:all]}'") 
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
         @category_options = ["Literatura", "Biografia", "Tecnologia", "Romance", "Ficção", "Juvenil", "Filosofia"]
      end

      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
      params.require(:book).permit(:title, :attachment, :author, :cover, :resume, :subtitle, :category)
   end
   
end
