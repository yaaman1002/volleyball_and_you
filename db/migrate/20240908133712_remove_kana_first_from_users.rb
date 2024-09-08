class RemoveKanaFirstFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :kana_first, :string
  end
end
