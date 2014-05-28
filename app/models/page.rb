class Page < ActiveRecord::Base
  attr_accessible :content, :title, :type
	belongs_to :user
	
	PAGE_TYPE = /blog|custom/
	validates :content, presence: true
	validates :title, presence: true
	validates :type, presence: true, format: { with: PAGE_TYPE }
	validates :user_id, presence: true
	
end
