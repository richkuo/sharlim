class StaticPagesController < ApplicationController
  def home
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

end
