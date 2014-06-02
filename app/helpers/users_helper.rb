module UsersHelper
	
	def color_helper(user)
		if user.color
			user.color
		else
			"#1F75FE"
		end
	end
	
end
