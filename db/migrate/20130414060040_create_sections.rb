class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :year
      t.string :term
      t.string :section
      t.integer :crn
      t.text :days
      t.text :time_start
      t.text :time_end
      t.references :instructor
      t.references :course

      t.timestamps
    end
    add_index :sections, :instructor_id
    add_index :sections, :course_id
  end
end
