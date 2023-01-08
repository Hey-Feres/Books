class ShelfBook < ApplicationRecord
  self.inheritance_column = 'kind'

  belongs_to :book
  belongs_to :user

  enum type: %i[favorite reading_list collection]
end
