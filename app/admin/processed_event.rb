ActiveAdmin.register ProcessedEvent do

  index do
    selectable_column
    column :id
    column :lux_value
    column :temperature_value
    column :humidity_value
    column :door_closed
    column :motion_detected
    column :person_out
    column :timestamp
    column :noise_level
    column :user_id
    actions
  end

end
