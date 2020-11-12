# frozen_string_literal: true

##
# Model that defines book methods
class Book < ApplicationRecord
  enum status: { pending: 'pending', approved: 'approved' }

  mount_uploader :attachment, AttachmentUploader
  mount_uploader :cover, BookCoverUploader

  validates :title, presence: true

  belongs_to :user
  belongs_to :author
  belongs_to :collection, optional: true

  alias_attribute :posted_by, :user

  before_save :check_self_approvment

  private

  def check_self_approvment
    self.status = 'approved' if posted_by.admin
  end
end
