class Note < ApplicationRecord
  belongs_to :feedback

  validates :content, presence: true
end