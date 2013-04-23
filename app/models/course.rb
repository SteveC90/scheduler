class Course < ActiveRecord::Base
  belongs_to :subject
  attr_accessible :name, :number, :subject_id
  has_many :sections
  before_destroy :check_for_sections
  validates :name, :number, :subject, presence: true
  validates :number, presence: true, length: { is: 3}, numericality: { only_integer: true }
  validates_associated :subject

  has_and_belongs_to_many :users
  private
    def check_for_sections
    	if sections.empty?
    		return true
    	else
    		return false
    	end
    end
end
