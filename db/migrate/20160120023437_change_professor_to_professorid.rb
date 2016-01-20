class ChangeProfessorToProfessorid < ActiveRecord::Migration
  def change
    rename_column :outlines, :professor, :professor_id
  end
end
