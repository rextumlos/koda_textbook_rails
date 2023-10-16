class Catfact < ApplicationRecord
  belongs_to :user
  validates :fact, presence: true
end
