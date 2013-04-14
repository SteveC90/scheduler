class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :number
      t.string :name
      t.references :subject

      t.timestamps
    end
    add_index :courses, :subject_id
  end
end
