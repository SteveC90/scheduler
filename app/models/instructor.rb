class Instructor < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, :email, presence: true, uniqueness: true
  validates :email, email_format: {message: 'format is incorrect'}
end
