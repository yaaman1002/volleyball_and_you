class CreateLikedPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :liked_posts do |t|
      t.integer :user, foreign_key: true, null: false
      t.integer :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
