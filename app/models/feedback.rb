class Feedback < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  validates :message, presence: true

  has_many :notes
  belongs_to :remark, optional: true
  belongs_to :user

  def destroy
    update(deleted_at: Time.now)
  end
end