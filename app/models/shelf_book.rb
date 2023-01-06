class ShelfBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum type: %i[favorite reading_list collection]
end
