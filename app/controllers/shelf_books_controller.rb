class ShelfBooksController < ApplicationController
  before_action :authenticate_user!

  def show
    @shelf_books = ShelfBook.where(book_id: params[:id], user_id: current_user.id)

    render json: @shelf_books
  end

  def create_and_destroy
    raise "Bananas" if true

    shelf_book = ShelfBook.where(book_id: shelf_book_params[:book_id], type: shelf_book_params[:type], user_id: current_user.id).last

    if shelf_book.present?
      shelf_book.destroy

      head :no_content
    else
      @shelf_book = ShelfBook.new(shelf_book_params.merge(user_id: current_user.id))

      if @shelf_book.save
        render json: @shelf_book, status: :created
      else
        render json: @shelf_book.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def shelf_book_params
    params.require(:shelf_book).permit(:book_id, :type)
  end
end
