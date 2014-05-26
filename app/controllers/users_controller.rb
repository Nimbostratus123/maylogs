class UsersController < ApplicationController
	
  def new
		@title = 'Sign Up'
		@page_id = 'sign_up'
		@user = User.new()
  end
	
	def show
		@user = User.find(params[:id])
		@title = @user.title
		@page_id = "user_#{@user.id}"
	end
	
	def create
		@user = User.new(params[:user])
		@user.username.downcase
		
		if @user.save
			sign_in @user
			flash[:success] = 'Welcome to Maylogs!'
			redirect_to @user
		else
			@page_id = "sign_up"
			render 'new'
		end
		
	end
	
end
