class Feedback < ApplicationRecord
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :message, presence: true

  has_many :notes
  belongs_to :remark, optional: true

  def destroy
    update(deleted_at: Time.now)
  end
end