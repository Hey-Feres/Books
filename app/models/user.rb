# frozen_string_literal: true

##
# Model that defines user methods
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :shelf_books, dependent: :destroy
  has_one :avatar, dependent: :destroy

  alias_attribute :books_posted, :books

  def name
    "Bruno"
  end
end
