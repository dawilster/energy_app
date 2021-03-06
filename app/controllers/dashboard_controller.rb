class DashboardController < ApplicationController

  def index
    @q = ProcessedEvent.ransack(params[:q])
    @processed_events = @q.result.page(params[:page]).per(120)

    @surveys = @processed_events.map(&:nearest_surveys).flatten.uniq

    selectable_columns
    csv_columns
    @short_times = @processed_events.collect{|x| x.timestamp.to_formatted_s(:short).to_s}
    respond_to do |format|
      format.html
      format.csv { render csv: @processed_events, filename: "events.csv" }
    end
  end

  def show
  end

  def csv_columns
    @csv_columns = []
    ProcessedEvent.column_names.each do |name|
      @csv_columns << name if params["#{name}_column"]
    end
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