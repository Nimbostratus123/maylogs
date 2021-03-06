class PagesController < ApplicationController
	before_filter :signed_in_user, except: [:display, :username_root]
	before_filter :correct_user, only: [:edit, :home_page, :update, :delete]
	before_filter :correct_user_for_posts, only: [:edit_post, :delete_post]
	before_filter :ensure_presence, only: [:username_root, :display]
	
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
		@page_id = 'edit_page'
		@title = 'Edit Page'
		@page = Page.find(params[:id])
  end

  def update
		@page = Page.find(params[:id])
		if @page.update_attributes(params[:page])
			flash[:success] = 'You have successfully edited the page.'
			redirect_to root_url
		else
			@page_id = 'edit_page'
			@title = 'Edit Page'
			render 'edit'
		end
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
		@title = @page.title
		@posts = @page.posts
		@page_id = 'page_show'
		@correct = (@user == current_user)
		render 'display', layout: false # page_username_path(User.find_by_username(params[:username]).home_page)
	end
	
	def new_post
		@page = Page.find(params[:page_id])
		@post = @page.posts.build(content: params[:content], title: params[:title])
		if @post.save
			flash[:success] = 'You have successfully posted!'
			redirect_to display_page_path(@page)
		else
			flash[:error] = 'Your post needs a title and content.'
			redirect_to display_page_path(@page)
		end
	end
	
	def delete_post
		Post.find(params[:post_id]).destroy
	end
	
	def edit_post
		@post = Post.find(params[:id])
		@post.title = params[:title]
		@post.content = params[:content]
		unless @post.save
			@message = 'Something has gone wrong—your post was not changed. Ensure it has both a title and content.'
		end
		render layout: false
	end
	
	def display
		@page = Page.find(params[:id])
		@user = User.find(@page.user_id)
		@title = @page.title
		@posts = @page.posts
		@page_id = 'page_show'
		@correct = (@user == current_user)
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
		
		def correct_user_for_posts
			if params[:post_id]
				@user = User.find(Page.find(Post.find(params[:post_id]).page_id).user_id)
			else
				@user = User.find(Page.find(Post.find(params[:id]).page_id).user_id)
			end
			unless @user == current_user
				redirect_to root_url
				flash[:error] = 'You do not have permission to access that page.'
			end
		end
		
		def ensure_presence
			if params[:username]
				@user = User.find_by_username(params[:username]) || render_404 and return
				if params[:id]
					if @page = Page.find_by_id(params[:id])
						@page.user == @user || render_404
					else
						render_404
						return
					end
				end
			end
		end
		
		def render_404
			render 'public/404.html'
		end
		
end
