class LikedPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates_uniquness_of :post_id, scope: :user_id
end
