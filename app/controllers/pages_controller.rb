class PagesController < ApplicationController
	before_filter :signed_in_user, except: [:display]
	before_filter :correct_user, only: [:edit, :home_page, :update, :delete]
	
  def new
		@page_id = 'new_page'
		@title = 'New Page'
		@page = current_user.pages.build
  end

  def create
		@page = current_user.pages.build(params[:page])
		@page.username = current_user.username
		if @page.save
			flash[:success] = 'You have successfully created a page.'
			redirect_to root_url
		else
			@page_id = 'new_page'
			@title = 'New Page'
			render 'new'
		end
  end

  def edit
  end

  def update
  end
	
	def home_page
		@page = Page.find(params[:id])
		@page.user.pages.each do |page|
			page.home = false
			page.save!
		end
		@page.home = true
		@page.save!
	end

  def delete
		@page = Page.find(params[:id])
		@page.destroy()
  end
	
	def username_root
		@user = User.find_by_username(params[:username])
		@page = @user.home_page
		render 'display', layout: false# page_username_path(User.find_by_username(params[:username]).home_page)
	end
	
	def display
		@page = Page.find(params[:id])
		@title = @page.title
		@page_id = 'page_show'
		if User.find(Page.find(params[:id]).user_id) == current_user
			@correct = true 
		end
		render layout: false
	end
	
	private
		
		def signed_in_user
			unless signed_in?
				store_location
				redirect_to log_in_url
				flash[:error] = 'Please Sign In'
			end
		end
		
		def correct_user
			@user = User.find(Page.find(params[:id]).user_id)
			unless @user == current_user
				redirect_to root_url
				flash[:error] = 'You do not have permission to access that page.'
			end
		end
		
end
