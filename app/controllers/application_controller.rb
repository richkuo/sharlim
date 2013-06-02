class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def not_found
  	raise ActionController::RoutingError.new('Not Found')
	end
	
	def after_sign_in_path_for(resource)
		root_path
	end

end
