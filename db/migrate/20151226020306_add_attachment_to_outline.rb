class AddAttachmentToOutline < ActiveRecord::Migration
  def change
    add_column :outlines, :attachment_file_name, :string
    add_column :outlines, :attachment_file_size, :string
    add_column :outlines, :attachment_content_type, :string
    add_column :outlines, :attachment_updated_at, :string
  end
end
