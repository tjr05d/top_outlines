class AddProfessorToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :professor, :string
  end
end
