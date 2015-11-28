class AddFileToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :file, :string
  end
end
