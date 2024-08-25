class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :notification, as: :notifiable, dependent: :destroy

  validates_uniqueness_of :post_id, scope: :user_id

end