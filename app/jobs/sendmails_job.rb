class ContactJob < ApplicationJob
  queue_as :default

  def perform(message)
    ContactMailer.submission(message).deliver
  end
end