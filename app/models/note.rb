class Note < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  belongs_to :feedback

  validates :content, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end