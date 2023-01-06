class CreateShelfBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :shelf_books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
