# frozen_string_literal: true

##
# Model that all the others inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
