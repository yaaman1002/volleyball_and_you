class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user, foreign_key: true, nulll: false
      t.integer :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
