class Note < ApplicationRecord
  belongs_to :feedback

  validates :content, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end