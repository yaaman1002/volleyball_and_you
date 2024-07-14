class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.text :introduction, null: false
      t.integer :user_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
