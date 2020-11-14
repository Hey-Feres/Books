# frozen_string_literal: true

##
# Model that defines book methods
class Book < ApplicationRecord
  enum status: { pending: 'pending', approved: 'approved' }

  mount_uploader :attachment, AttachmentUploader
  mount_uploader :cover, BookCoverUploader

  validates :title, presence: true

  belongs_to :author
  belongs_to :collection, optional: true
end
