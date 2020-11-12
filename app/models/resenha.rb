# frozen_string_literal: true

##
# Model that defines resenha methods
class Resenha < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
