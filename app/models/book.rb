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

  after_save :set_parsed_content

  def set_parsed_content
    return nil if !attachment.file.file.present?

    update_column(:parsed_content, PDF::Reader.new(attachment.file.file).pages.map(&:text).join)
  end
end
