class User < ApplicationRecord
	
	before_save {
		self.email = email.downcase
	}
	has_many :microposts
	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
			length: { in: 6..20 }, uniqueness: true #{ case_sensitive: false}
	validates :name, presence: true
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password

	def details
		"Joined on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
	end

	def to_s
		"Name: #{name}, Emal: #{email}"
	end

	def post_count
		microposts.count 
	end

end
