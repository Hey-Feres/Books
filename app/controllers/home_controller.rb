# frozen_string_literal: true

##
# Controller that define home actions
class HomeController < ApplicationController
  def index
    @books = Book.all
  end
end
