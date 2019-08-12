class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :attachment
      t.string :author
      t.string :cover
      t.text :resume

      t.timestamps
    end
  end
end
