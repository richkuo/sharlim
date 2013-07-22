class StaticPagesController < ApplicationController
  before_filter :admin_user,      only: [:admin]
  def home
    # this is the 'featured' event
    @event = Event.last
  end

  def about
  end

  def help
  end

  def contact
  end

  def terms
  end

  def privacy
  end

  def bryan_thomas
    @event = Event.first
  end

  def david_otunga
    @event = Event.first
  end

  def admin
    @events = Event.all
    @users = User.all
  end
  

  private

  def admin_user
    redirect_to(root_url) unless current_user && current_user.admin?
  end

end
