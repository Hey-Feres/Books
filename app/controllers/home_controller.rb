# frozen_string_literal: true

##
# Controller that define home actions
class HomeController < ApplicationController
  BookStruct = Struct.new(:id, :title, :cover, :content_preview, keyword_init: true)

  def index
    @recently_added = []
    Book.last(3).each do |book|
      @recently_added << BookStruct.new(
        id: book.id,
        title: book.title,
        cover: book.cover.url,
        content_preview: PDF::Reader.new(book.attachment.file.file).pages.sample.text.truncate(960)
      )
    end

    @books = []
    Book.all.each do |book|
      @books << BookStruct.new(
        id: book.id,
        title: book.title,
        cover: book.cover.url,
        content_preview: PDF::Reader.new(book.attachment.file.file).pages.sample.text.truncate(960)
      )
    end
  end
end
