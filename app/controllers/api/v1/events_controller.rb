class Api::V1::EventsController < BaseApiController
  actions :index, :show, :create

  def mapped_params(params)
    mappings = {
      "name" => :sensor_type,
      "linkText" => :display_name,
      "value" => :value
    }

    if params[:event].kind_of?(Array)
      mapped = Hash[params[:event][0].map {|k, v| [mappings[k], v] }]
    else
      mapped = Hash[params[:event].map {|k, v| [mappings[k], v] }]
    end

    return ActionController::Parameters.new(event: mapped)
  end

  def permitted_params
    mapped_params(params).permit(:event => [
      :display_name,
      :sensor_type,
      :value
    ])
  end

end