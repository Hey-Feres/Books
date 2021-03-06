# frozen_string_literal: true

class AddCollectionReferencesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :collection, foreign_key: true
  end
end
