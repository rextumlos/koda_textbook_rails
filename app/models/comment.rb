class Comment < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  belongs_to :post

  validates :content, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end
