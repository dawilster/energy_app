class DashboardController < ApplicationController

  def index
    @q = ProcessedEvent.ransack(params[:q])
    @processed_events = @q.result.page(params[:page])

    selectable_columns
  end

  def show
  end

  def selectable_columns
    @columns = []
    ProcessedEvent.column_names.each do |name|
      case name
      when "temperature_value"
        unit = '°C'
      when "lux_value"
        unit = 'lx'
      when "humidity_value"
        unit = "%"
      else
        unit = ""
      end
      @columns << {name: name, unit: unit} if params["#{name}_column"]
    end
  end
end