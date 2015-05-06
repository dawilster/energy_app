ActiveAdmin.register Survey do

  csv do
    column :occupants
    column :temperature_value
    column :noise_level
    column :comment
    column :user_id
    column :in_out
    column(:timestamp) { |s| s.created_at }
  end


end
