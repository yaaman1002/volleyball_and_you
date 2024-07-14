class Post < ApplicationRecord
  
  has_many_attached :images
  belongs_to :user
  has_many :liked_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
