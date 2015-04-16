class Api::V1::SurveysController < BaseApiController
  actions :create, :show

  def permitted_params
    params.permit(:survey => [
      :occupants,
      :noise_level,
      :temperature_value,
      :user_id
    ])
  end
end