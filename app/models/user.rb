# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  title      :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

	attr_accessible :email, :title, :username, :password, 
									:password_confirmation, :color
	has_secure_password
	
	has_many :pages, dependent: :destroy

	
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
	VALID_USERNAME = /^\S*$/
	validates :title, presence: true, length: { maximum: 50 }
	validates :username, presence: true, uniqueness: true,
		 				length: { maximum: 50 }, format: {with: VALID_USERNAME}
	validates :email, presence: true, format: { with: VALID_EMAIL }, 
						uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }, confirmation: true
	validates :password_confirmation, presence: true
	
	
	def home_page
		self.pages.each do |page|
			@homepage = page if page.home
		end
		@homepage
	end
	
	def has_home?
		if self.home_page
			true
		else
			false
		end
	end
	
	private
		
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
	
	
end
