# frozen_string_literal: true

class AddSubtitleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :subtitle, :string
  end
end
