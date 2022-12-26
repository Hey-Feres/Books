class Category < ApplicationRecord
	mount_uploader :icon, CategoryIconUploader

	has_and_belongs_to_many :books
end
