class Comment < ApplicationRecord
  validates :comment,length: { in: 1..140 }

  belongs_to :user
  belongs_to :post
end
