class ChangeUserToSeller < ActiveRecord::Migration
  def change
    rename_column :outlines, :user_id, :seller_id
  end
end
