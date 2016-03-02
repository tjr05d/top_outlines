class AddMerchantToUser < ActiveRecord::Migration
  def change
    add_column :users, :merchant_account, :string
  end
end
