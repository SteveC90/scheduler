class User < ActiveRecord::Base
	ROLES = %w[student professor admin]
	attr_accessible :name, :password, :password_confirmation, :photo, :role
	validates :name, presence: true, uniqueness: true
	has_secure_password

	has_and_belongs_to_many :courses
	has_attached_file :photo, :path => "cs446/chavez/#{Rails.env}:url", :styles => { :thumb => "38x38>", :large => "300x300>"}
end
