class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :icon
      t.string :title

      t.timestamps
    end
  end
end
