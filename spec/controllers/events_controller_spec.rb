require 'rails_helper'

RSpec.describe Api::V1::EventsController, :type => :controller do

  def temperature_event
    {
      "name" => "temperature",
      "linkText" => "Aeon Multisensor (Irvan)",
      "value" => "25.2"
    }
  end

  describe "create" do
    it "returns 200" do
      post :create, format: :json, "event" => [temperature_event]
      expect(response.response_code).to eq 201
    end
  end
end
