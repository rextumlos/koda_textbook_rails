class Feedback < ApplicationRecord
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :message, presence: true

  enum :remark, { unmarked: 0, neutral: 1, good: 2, bad: 3  }, suffix: true

  has_many :notes
end