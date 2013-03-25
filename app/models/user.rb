class User < ActiveRecord::Base
	attr_accessible :name, :password, :password_confirmation, :photo
	validates :name, presence: true, uniqueness: true
	has_secure_password

	has_attached_file :photo, :styles => { :thumb => "32x32>"}
end
