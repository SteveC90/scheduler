class Course < ActiveRecord::Base
  belongs_to :subject
  attr_accessible :name, :number, :subject_id
  has_many :sections
  validates :name, :number, :subject, presence: true
  validates :number, presence: true, length: { is: 3}, numericality: { only_integer: true }
  validates_associated :subject
end
