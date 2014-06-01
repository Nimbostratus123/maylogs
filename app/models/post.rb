class Post < ActiveRecord::Base
  attr_accessible :content, :title
	belongs_to :page
	
	validates :content, presence: true
	validates :title, presence: true
	validates :page_id, presence: true
	
end
