class ApplicationController < ActionController::Base

  protect_from_forgery

  private

  def upcoming_events
    @upcoming_events #= Event.where('date >= ?', Time.now).order('date DESC').limit(5)
  end
  helper_method :upcoming_events
end
