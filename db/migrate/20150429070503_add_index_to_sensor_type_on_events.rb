class AddIndexToSensorTypeOnEvents < ActiveRecord::Migration
  def change
    add_index :events, :sensor_type
  end
end
