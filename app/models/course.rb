class Course < ActiveRecord::Base
  attr_accessible :course_num, :credits, :crn, :days, :instructor, :location, :section, :subject, :term, :times, :title, :year
end
