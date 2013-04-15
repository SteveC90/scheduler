class Section < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :course
  attr_accessible :crn, :days, :section, :term, :time_end, :time_start, :year, :course_id
  validates :crn, :section, :term, :year, presence: true
  validates_associated :instructor, :course
  serialize :days, Hash
  serialize :time_start, Hash
  serialize :time_end, Hash
end
