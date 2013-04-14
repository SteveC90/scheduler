class Section < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :course
  attr_accessible :crn, :days, :section, :term, :time_end, :time_start, :year, :course_id
end
