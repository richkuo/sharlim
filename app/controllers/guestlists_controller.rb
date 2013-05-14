class GuestlistsController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

	respond_to :html, :js

	def show
	end

	def index
	end

	def create
		begin
		# puts @event
		# puts 'GuestlistsController create'*11
		# puts params.inspect
		@event = Event.find_by_id(params[:guestlist][:event_id])
		@event.add_viewer!(current_user)
		respond_with @event

		rescue
			puts $!
	  	flash[:error] = "Error"
	  	redirect_to charges_path
		end
	end
end
