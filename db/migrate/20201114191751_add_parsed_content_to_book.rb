class AddParsedContentToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :parsed_content, :text
  end
end
