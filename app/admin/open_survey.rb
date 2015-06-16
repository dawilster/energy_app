ActiveAdmin.register OpenSurvey do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  csv do
    column :location
    column :happy_level
    column :excited_level
    column :safe_level
    column :peace_level
    column :comment
    column(:timestamp) { |s| s.created_at }
  end

end
