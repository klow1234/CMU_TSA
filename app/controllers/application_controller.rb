class ApplicationController < ActionController::Base

  protect_from_forgery

  private

  def upcoming_events
    @upcoming_events = Refinery::Events::Event.where('date >= ?', Time.now).order('date DESC').limit(5)
    @upcoming_events
  end
  helper_method :upcoming_events
end
