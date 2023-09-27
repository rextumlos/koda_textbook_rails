class Feedback < ApplicationRecord
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :message, presence: true
end