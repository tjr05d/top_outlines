class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :purchases, :user_id, :buyer_id
  end
end
