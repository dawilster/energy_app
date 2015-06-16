class Api::V1::OpenSurveysController < BaseApiController
  actions :create, :show

  def permitted_params
    params.permit(:open_survey => [
      :date,
      :time,
      :location,
      :excited_level,
      :safe_level,
      :happy_level,
      :peace_level,
      :comment
    ])
  end
end