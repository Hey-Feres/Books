# frozen_string_literal: true

##
# Controller that define books actions
class BooksController < ApplicationController
  before_action :set_options, only: %i[new create edit update index]
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.where(status: 'approved').order('created_at desc')
    @reader = PDF::Reader.new(open("#{root_url}#{Book.first.attachment.url}"))
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
      if @book.status == 'pending'
        redirect_to books_path, notice: "O livro #{@book.title} foi enviado para aprovação. Obrigado :)"
      else
        redirect_to books_path, notice: "O livro #{@book.title} foi salvo. Obrigado :)"
      end
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: "O livro #{@book.title} foi atualizado. Obrigado :)" }
        format.json { render :show, status: :ok, location: books_url }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "O livro #{@book.title} foi removido!"
  end

  def load_pages
    reader = PDF::Reader.new(Book.first.attachment.file.file)
    pages = []
    10.times do |i|
      pages << {
        page: i + params[:starting_at].to_i,
        page_content: reader.pages[i + params[:starting_at].to_i].text
      }
    end
    render json: pages
  end

  private

  def set_options
    @category_options = %w[Literatura Biografia Tecnologia Romance Ficção Juvenil Filosofia]
    @authors = Author.all.order(name: 'asc').pluck(:name, :id)
    @collections = Collection.all.order(name: 'asc').pluck(:name, :id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :attachment, :author_id, :cover, :resume, :subtitle, :category, :user_id)
  end
end
