class Post < ApplicationRecord
  validates :posted_text,length: { in: 1..140 }
  
  has_one_attached :image
  
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  belongs_to :user
end
