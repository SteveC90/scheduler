class Subject < ActiveRecord::Base
  attr_accessible :abrev, :name
  has_many :courses
  validates :name, :abrev, presence: true, uniqueness: true

  before_destroy :check_for_courses

  private
  	def check_for_courses
  		if courses.empty?
  			return true
  		else
  			return false
  		end
  	end
end
