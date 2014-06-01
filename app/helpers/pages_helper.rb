module PagesHelper
	
	def no_link_helper
		if Rails.env.test?
			'#'
		else
			'javascript:;'
		end
	end
	
	def color_beam_helper(page1, page2)
		if page1 == page2
			return 'starting_link'
		end
	end
	
	def page_username_path(page)
		 "/#{page.username}/#{page.id}"
	end
	
	def username_path(user_or_page)
		"/#{user_or_page.username}"
	end
	
	def filter_content_custom(content)
		content
	end
	
end
