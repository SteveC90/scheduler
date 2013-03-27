class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :subject
      t.integer :course_num
      t.integer :crn
      t.integer :year
      t.string :section
      t.string :term
      t.string :title
      t.decimal :credits
      t.text :days
      t.text :times
      t.string :instructor
      t.string :location

      t.timestamps
    end
  end
end
