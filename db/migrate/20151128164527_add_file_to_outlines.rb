class AddFileToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :attachment, :string
  end
end
