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
	
end
