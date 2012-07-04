class ApplicationController < ActionController::Base

  protect_from_forgery

  private

  def upcoming_events
    @upcoming_events = Refinery::Events::Event.where('date >= ?', Time.now).order('date ASC').limit(5)
    @upcoming_events
  end
  helper_method :upcoming_events

  def image_slider
    @images = Refinery::BannerImages::BannerImage.order('position ASC')
    @images
  end
  helper_method :image_slider
end
