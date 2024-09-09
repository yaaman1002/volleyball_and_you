class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :user, source: :user
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }

  # 画像の1枚目のみ対応
  def get_image
    unless images.first
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    images.first
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%' + content)
    else
      Post.where('title LIKE ?', '%' + content + '%')
    end
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id)
    end
  end
  
  

end
