class Book < ApplicationRecord
    enum status: { pending: "pending", approved: "approved" }

    mount_uploader :attachment, AttachmentUploader
  	mount_uploader :cover, BookCoverUploader
	
    validates :title, presence: true

    belongs_to :user
    belongs_to :author
    belongs_to :collection, optional: true

    alias_attribute :posted_by, :user

    before_save :check_self_approvment

    def self.search(search)
    	if search
    		where(["category LIKE ?", "%#{search}%"])
    	else
    		all
    	end
    end

    private
        def check_self_approvment
            if self.posted_by.admin
                self.status = "approved"
            end
        end
end
