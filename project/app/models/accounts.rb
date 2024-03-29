class Accounts < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password

	has_one :applicant, :dependent=>:destroy
	has_one :sponsor, :dependent=>:destroy

	validates_presence_of :username
	validates_uniqueness_of :username, :case_sensitive=>false
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	validates_presence_of :password
	validates_confirmation_of :password	

	def self.authenticate(username, password)
		user = find_by_username(username)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end	


end
