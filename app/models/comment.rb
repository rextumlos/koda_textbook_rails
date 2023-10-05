class Comment < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end
