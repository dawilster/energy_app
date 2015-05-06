class LabSurveysController < InheritedResources::Base
  actions :new, :show, :create

  def permitted_params
    params.permit(:lab_survey => [
      :room_id,
      :temperature_value,
      :noise_level,
      :comfort_level
    ])
  end
end