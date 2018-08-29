class User < ApplicationRecord
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: :topic

  validates :name, presence: true
  validates :email, presence: true

  has_secure_password
end
