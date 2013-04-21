class Instructor < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :sections
  before_destroy :check_for_sections
  validates :name, :email, presence: true, uniqueness: true
  validates :email, email_format: {message: 'format is incorrect'}

  private
  	def check_for_sections
    	if sections.empty?
    		return true
    	else
    		return false
    	end
    end
end
