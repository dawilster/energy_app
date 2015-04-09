class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :display_name
      t.string :sensor_type

      t.integer :illuminance_value
      t.integer :temperature_value
      t.integer :humidity_value
      t.integer :battery_value
      t.integer :motion_state
      t.integer :power_value
      t.integer :decibal_value

      t.boolean :contact_state
      t.boolean :switch_state

      t.string :user_id
      t.string :type

      t.timestamps null: false
    end
  end
end
