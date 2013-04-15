class Section < ActiveRecord::Base
	TERMS = ["Spring", "Fall", "Summer One", "Summer Two"]
  belongs_to :instructor
  belongs_to :course
  attr_accessible :crn, :section, :term, :time_end, :time_start, :year, :course_id, :instructor_id
  validates :crn, :section, :term, :year, :course_id, :instructor_id, presence: true
  validates :year, :crn, numericality: { only_integer: true }
  validates :year, length: { is: 4 }
  validates_associated :instructor, :course
  serialize :time_start, Hash
  serialize :time_end, Hash
end
