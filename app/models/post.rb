class Post < ApplicationRecord
  validates :posted_text,length: { maximum: 140 }
  validates :image, presence: true

  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  belongs_to :user, optional: true
  # ログイン中のユーザーがその投稿に対していいねをしているかを判断する
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
  
  # 投稿文の内容と部分的に一致してればヒット
  def self.looks(search, word)
    @post = Post.where("posted_text LIKE?", "%#{word}%")
  end
end
