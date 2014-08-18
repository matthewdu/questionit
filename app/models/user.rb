class User < ActiveRecord::Base
	# associations
	has_many :answers

	# Save a downcased version of the username for login
	before_save { self.username = username.downcase }
	before_create :create_remember_token

	validates(:username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false } )

	has_secure_password
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end
