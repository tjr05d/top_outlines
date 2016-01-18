class AddSellerToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :seller_id, :integer
  end
end
