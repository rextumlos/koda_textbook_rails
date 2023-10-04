class Remark < ApplicationRecord
  validates :name, presence: true

  has_many :posts, dependent: :restrict_with_error
end