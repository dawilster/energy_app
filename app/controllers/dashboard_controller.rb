class DashboardController < ApplicationController

  def index
    @q = ProcessedEvent.ransack(params[:q])
    @processed_events = @q.result.page(params[:page])
  end

  def show
  end
end