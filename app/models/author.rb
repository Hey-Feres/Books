# frozen_string_literal: true

##
# Model that defines author methods
class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end
