class Remark < ApplicationRecord
  validates :name, presence: true

  has_many :feedbacks, dependent: :restrict_with_error
end