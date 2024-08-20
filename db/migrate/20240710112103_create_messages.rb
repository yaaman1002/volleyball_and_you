class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :send_user_id
      t.integer :receive_user_id
      t.timestamps
    end
  end
end
