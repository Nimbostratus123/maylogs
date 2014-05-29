class Page < ActiveRecord::Base
  attr_accessible :content, :title, :kind, :home
	belongs_to :user
	
	PAGE_KIND = /blog|custom/
	validates :content, presence: true
	validates :title, length: { maximum: 50, minimum: 6 }, presence: true
	validates :kind, presence: true, format: { with: PAGE_KIND }
	validates :user_id, presence: true
	
	def home?
		self.home
	end
	
	def home_page?
		self.home
	end
	
end
