class ChangeProfessoridToInteger < ActiveRecord::Migration
  def change
    change_column :outlines, :professor_id, :integer
  end
end
