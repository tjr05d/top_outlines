class AddPriceToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :price, :string
  end
end
