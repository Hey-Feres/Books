# frozen_string_literal: true

##
# Model that defines collection methods
class Collection < ApplicationRecord
  has_many :books, dependent: :destroy
end
