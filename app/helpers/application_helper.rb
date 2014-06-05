module ApplicationHelper
	include StaticHelper
	include SessionsHelper
	include UsersHelper
	
	def render_404
	  raise ActionController::RoutingError.new('Page does not exist.')
	end
	
end
