class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|
      t.string :title
      t.text :description
      t.references :course, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
