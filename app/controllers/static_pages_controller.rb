class StaticPagesController < ApplicationController
  def home
    @event = Event.first
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

  def bryan_demo
  end
end
