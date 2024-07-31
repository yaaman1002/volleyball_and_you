class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  has_many :liked_posts, dependent: :destroy
  has_many :comments, dependent: :destroy

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
      Post.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('name LIKE ?', '%' + content)
    else
      Post.where('name LIKE ?', '%' + content + '%')
    end
  end

end
