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
		content = content.gsub(/script/i, 'scr¡pt')
		content = content.gsub(/onclick/i, 'oncl¡ck')
		content = content.gsub(/on/i, 'ōn')
		content = content.gsub(/behavior/i, 'behav¡or')
		content = content.gsub(/binding/i, 'b¡nd¡ng')
		content = content.gsub(/expression/i, 'express¡on')
		content = content.gsub(/url/i, 'ur¡')
		content.html_safe
	end
	
	def filter_content_blog(content)
		content = strip_tags(content)
		content = content.gsub(/script/i, 'scr¡pt')
		content = content.gsub(/onclick/i, 'oncl¡ck')
		content = content.gsub(/\n/, "<br />")
		content.match(/\/\/image (\S*)\b/)
		content = content.gsub(/\/\/image \S*\b/, "<img src ='#{$1}' class = 'image' alt = 'image' />")
		content = content.gsub(/\(\(i/, '<i>')
		content = content.gsub(/i\)\)/, '</i>')
		content = content.gsub(/\(\(b/, '<b>')
		content = content.gsub(/b\)\)/, '</b>')
		content.html_safe
	end
end
