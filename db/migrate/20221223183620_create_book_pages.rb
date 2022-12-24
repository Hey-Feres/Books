class CreateBookPages < ActiveRecord::Migration[5.2]
  def change
    create_table :book_pages do |t|
      t.text :content
      t.integer :number
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
