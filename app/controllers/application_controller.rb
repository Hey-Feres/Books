# frozen_string_literal: true

##
# Controller that all the others inherit from
class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  protect_from_forgery unless: -> { request.format.json? }

  skip_before_action :verify_authenticity_token
end
