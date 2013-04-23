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

  before_save :remove_empty_from_hash

  private
    def remove_empty_from_hash
      time_start.each do |key, value|
        if value == "" && time_end[key.to_sym] == ""
          time_start.delete key.to_sym
          time_end.delete key.to_sym
        elsif (value != "" && time_end[key.to_sym] == "") || (value == "" && time_end[key.to_sym] != "")
          errors.add(:base, 'Something is wrong with class times.')
          return false
        end
      end
    end
end
