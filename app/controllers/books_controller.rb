# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_query_params, only: %i[index]
  before_action :set_options, only: %i[new create edit update index]
  before_action :set_book, only: %i[show edit update destroy read]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result
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
    book = Book.find(params[:book_id])

    pages = book.pages.offset(params[:offset].to_i).first(10)

    render json: pages
  end

  def read
  end

  private

  def set_query_params
    return unless params[:search].present?

    params[:q] = { title_cont: params[:search] }
  end

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
