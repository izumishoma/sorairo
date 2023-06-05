class Comment < ApplicationRecord
  validates :commet,length: { in: 1..140 }
  
  belongs_to :user
  belongs_to :post
end
