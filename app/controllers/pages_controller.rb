class PagesController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: [:edit, :update, :delete]
	
  def new
		@page_id = 'new_page'
		@title = 'New Page'
		@page = current_user.pages.build
  end

  def create
		@page = current_user.pages.build(params[:page])
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

  def delete
		@page = Page.find(params[:id])
		@page.destroy()
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
