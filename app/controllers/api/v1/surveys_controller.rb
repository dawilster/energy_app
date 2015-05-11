class Api::V1::SurveysController < BaseApiController
  actions :create, :show

  def permitted_params
    params.permit(:survey => [
      :occupants,
      :noise_level,
      :temperature_value,
      :in_out,
      :comment,
      :user_id,
      :date,
      :time
    ])
  end
end