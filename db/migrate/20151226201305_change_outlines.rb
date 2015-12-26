class ChangeOutlines < ActiveRecord::Migration
  def change
    change_column_default(:outlines, :price, "5")
  end
end
