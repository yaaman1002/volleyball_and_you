class Message < ApplicationRecord
  belongs_to :send_user, class_name: 'User'
  belongs_to :receive_user, class_name: 'User'
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 140 }


  after_create do
    notifications.create(user_id: receive_user_id)
  end
end
