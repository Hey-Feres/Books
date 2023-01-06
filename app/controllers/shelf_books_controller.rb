class ShelfBooksController < ApplicationController
  def show
  end

  def create
    @shelf_book = ShelfBook.new(shelf_book_params.merge(user_id: current_user.id))

    if @shelf_book.save
      render json: @shelf_book, status: :success
    else
      render json: @shelf_book.errors, status: :unprocessable_entity
    end
  end

  private

  def shelf_book_params
    params.require(:shelf_book).permit(:book_id, :type)
  end
end
