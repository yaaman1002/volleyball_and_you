class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates_uniqueness_of :post_id, scope: :user_id
  
  after_create do
    notifications.create(user_id: user_id)
  end
end