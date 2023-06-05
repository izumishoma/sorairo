class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  validates :name, presence: true
  validates :display_name, presence: true
  validates :introduction,length: { maximum: 140 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true,length: { minimum: 6 }

  has_many :posts, dependent: :destroy
  has_many :commets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower



  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  # def get_image(width, height)
  #   (image.attached?) ? image : 'no_image.jpg'
  #   image.variant(resize_to_limit: [width, height]).processed
  # end
end
