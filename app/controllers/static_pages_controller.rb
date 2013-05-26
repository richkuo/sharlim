class StaticPagesController < ApplicationController
  def home
    @event = Event.find(1)
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
end
