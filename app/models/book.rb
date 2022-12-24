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
  has_many :book_pages

  alias_attribute :pages, :book_pages

  after_save :create_pages

  def create_pages
    return unless attachment.file.file.present?

    pages = PDF::Reader.new(attachment.file.file).pages.map{|page| {number: page.number, text: page.text}}
    book_pages = []

    pages.each do |page|
      book_pages << BookPage.new(book_id: id, content: page[:text], number: page[:number])
    end

    BookPage.import book_pages
  end
end
