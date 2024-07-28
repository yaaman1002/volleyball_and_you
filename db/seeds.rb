# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

olivia = User.find_or_create_by(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg.jpeg"), filename:"sample-user1.jpg.jpeg")
end

james = User.find_or_create_by(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg.jpeg"), filename:"sample-user2.jpg.jpeg")
end

lucas = User.find_or_create_by(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpeg"), filename:"sample-user3.jpg")
end

Post.find_or_create_by!(title: "初バレーボール観戦") do |one_post|
  one_post.images=ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post1.jpeg"), filename:"sample_post1.jpeg")
  one_post.body="楽しかった！"
  one_post.user_id=1
end

Post.find_or_create_by!(title: "ウルフドックス名古屋") do |one_post|
  one_post.images=ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post2.jpeg"), filename:"sample_post2.jpeg")
  one_post.body="大接戦の試合でした！"
  one_post.user_id=2
end

Post.find_or_create_by!(title: "オリンピック初戦") do |one_post|
  one_post.images=ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_post3.jpeg"), filename:"sample_post3.jpeg")
  one_post.body="ナイスゲームだったけど悔しい"
  one_post.user_id=3
end