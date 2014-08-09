class User < ActiveRecord::Base

	# Save a downcased version of the username for login
	before_save { self.username = username.downcase }
	validates(:username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false } )


	has_secure_password
	validates :password, length: { minimum: 6 }
end
