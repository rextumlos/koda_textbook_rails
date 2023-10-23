class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :feedbacks
  has_many :catfacts

  enum genre: { client: 0, admin: 1}

  validates :phone_number, presence: true
  validates :name, presence: true
end
