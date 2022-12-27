# frozen_string_literal: true

class HomeController < ApplicationController
  BookStruct = Struct.new(:id, :title, :cover, :content_preview, keyword_init: true)

  def index
    @categories = Category.first(9)
    @books = Book.last(6)
    @recently_added = @books
  end
end
