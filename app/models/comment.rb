class Comment < ApplicationRecord
  belongs_to :post

  validates :content, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end
