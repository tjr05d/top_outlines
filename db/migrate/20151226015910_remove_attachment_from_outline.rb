class RemoveAttachmentFromOutline < ActiveRecord::Migration
  def change
    remove_column :outlines, :attachment, :string
  end
end
