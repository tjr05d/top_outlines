class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :course_number
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
