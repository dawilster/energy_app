class DashboardController < ApplicationController

  def index
    @events = Event.where('created_at > ?', 5.days.ago)
  end

  def show
  end
end