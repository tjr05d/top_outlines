class AddSchoolToOutline < ActiveRecord::Migration
  def change
    add_column :outlines, :school_id, :integer
  end
end
