class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password

  validates :name, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
  validates :password, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
  
  def self.authenticate(emailorname, password)
  	user = User.where("email IS ? OR name IS ?", emailorname, emailorname)[0]
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
