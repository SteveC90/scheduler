class Subject < ActiveRecord::Base
  attr_accessible :abrev, :name
  has_many :courses
  validates :name, :abrev, presence: true, uniqueness: true

  before_destroy :ensure_not_referenced_by_any_course

  private
  	def ensure_not_referenced_by_any_course
  		if courses.empty?
  			return true
  		else
  			errors.add(:base, 'This subject is referenced by 1 or more courses')
  			return false
  		end
  	end
end
