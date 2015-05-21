class DashboardController < ApplicationController

  def index
    @q = ProcessedEvent.ransack(params[:q])
    @processed_events = @q.result.page(params[:page]).per(120)

    selectable_columns
    @short_times = @processed_events.collect{|x| x.timestamp.to_formatted_s(:short).to_s}
  end

  def show
  end

  def selectable_columns
    @columns = []
    type = "spline"
    unit = ""
    ProcessedEvent.column_names.each do |name|
      case name
      when "temperature_value"
        unit = '°C'
      when "lux_value"
        unit = 'lx'
      when "humidity_value"
        unit = "%"
      when "occupants_value"
      when "survey_flag"
        type = "scatter"
      else
        unit = ""
      end
      @columns << {name: name, unit: unit, type: type} if params["#{name}_column"]
    end
  end
end