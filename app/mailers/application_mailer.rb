# frozen_string_literal: true

##
# Mailer that all the others inherit from
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
