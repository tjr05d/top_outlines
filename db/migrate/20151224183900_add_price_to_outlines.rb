class AddPriceToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :price, :string
  end
end
