class StaticController < ApplicationController
  def home
		@page_id = 'home'
  end

  def search
  end

  def reference
		@title = 'Reference'
		@page_id = @title.downcase
  end

  def about
		@title = 'About'
		@page_id = @title.downcase
  end
end
