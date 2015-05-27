ActiveAdmin.register Survey do
  permit_params :occupants, :temperature_value, :noise_level, :comment, :user_id, :in_out, :created_at

  index do
    column :occupants
    column :temperature_value
    column :noise_level
    column :comment
    column :user_id
    column :in_out
    column(:timestamp) { |s| s.created_at }
  end

  form do |f|
    inputs 'Details' do
      input :occupants
      input :temperature_value
      input :noise_level
      input(:created_at)
      input :comment
      input :user_id
      input :in_out
    end
    actions
  end

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
