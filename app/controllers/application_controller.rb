class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def not_found
  	raise ActionController::RoutingError.new('Not Found')
	end
	
	def after_sign_in_path_for(resource)
		root_path
	end

  private

    def correct_host
      @event = Event.find(params[:id])
      @user = User.find(current_user.id)
      redirect_to(root_url) unless @user.host?(@event)
    end

    def admin_user
      redirect_to(root_url) unless current_user && current_user.admin?
    end

end
