class CreateProcessedEvents < ActiveRecord::Migration
  def change
    create_table :processed_events do |t|
      t.float :lux_value
      t.float :temperature_value
      t.float :humidity_value
      t.boolean :door_closed
      t.float :power_value
      t.boolean :motion_detected
      t.boolean :person_out

      t.integer :user_id
      t.timestamps null: false
    end
  end
end
