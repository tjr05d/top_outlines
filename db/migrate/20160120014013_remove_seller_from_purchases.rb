class RemoveSellerFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :seller_id
  end
end
