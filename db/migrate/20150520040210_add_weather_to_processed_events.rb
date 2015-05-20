class AddWeatherToProcessedEvents < ActiveRecord::Migration
  def change
    add_column :processed_events, :outside_temperature, :float, default: 0
  end
end
