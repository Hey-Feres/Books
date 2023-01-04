# frozen_string_literal: true

class HomeController < ApplicationController
  BookStruct = Struct.new(:id, :title, :resume, :cover, :attachment, :author_name, keyword_init: true)

  def index
    @categories = Category.first(9)
    @books = fill_book_struct
    @recently_added = @books
  end

  private

  def fill_book_struct
    Book.last(6).map { |book| BookStruct.new(id: book.id, title: book.title, resume: book.resume, cover: book.cover, attachment: book.attachment, author_name: book.author_name) }
  end
end
