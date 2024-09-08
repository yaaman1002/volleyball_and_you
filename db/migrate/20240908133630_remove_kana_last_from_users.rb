class RemoveKanaLastFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :kana_last, :string
  end
end
