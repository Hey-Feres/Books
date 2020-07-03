class Book < ApplicationRecord
    enum status: { pending: "pending", approved: "approved" }

    mount_uploader :attachment, AttachmentUploader
  	mount_uploader :cover, BookCoverUploader
	
    validates :title, presence: true
    validates :author, presence: true

    belongs_to :user

    alias_attribute :posted_by, :user

    def self.search(search)
    	if search
    		where(["category LIKE ?", "%#{search}%"])
    	else
    		all
    	end
    end

end
