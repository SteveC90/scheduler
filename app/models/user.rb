class User < ActiveRecord::Base
	ROLES = %w[student professor admin]
	attr_accessible :name, :password, :password_confirmation, :photo, :role
	validates :name, presence: true, uniqueness: true
	has_secure_password


	has_attached_file :photo, :styles => { :thumb => "38x38>", :large => "300x300>"}
end
