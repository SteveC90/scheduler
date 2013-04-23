class AddCoursesUsers < ActiveRecord::Migration
  def self.up
  	create_table :courses_users, :id => false do |t|
  		t.integer :course_id
  		t.integer :user_id
  	end
  end

  def self.down
  	drop_table :courses_users
  end
end
