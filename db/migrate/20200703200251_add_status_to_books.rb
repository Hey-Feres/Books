# frozen_string_literal: true

class AddStatusToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :status, :string, default: 'pending'
  end
end
