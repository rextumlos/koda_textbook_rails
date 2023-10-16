class Note < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  belongs_to :feedback, counter_cache: true

  validates :content, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end