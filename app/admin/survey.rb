ActiveAdmin.register Survey do

  csv do
    column :occupants
    column :temperature_value
    column :noise_level
    column :comment
    column :user_id
    column :in_out
    column(:timestamp) { |survey| s.created_at }
  end


end
