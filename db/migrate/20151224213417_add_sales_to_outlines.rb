class AddSalesToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :sales, :integer, :default => 0
  end
end
