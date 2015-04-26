
require 'rails_helper'

RSpec.describe Api::V1::EventsController, :type => :controller do

  def temperature_event
    {
      "name" => "temperature",
      "linkText" => "Aeon Multisensor (Irvan)",
      "value" => "25.2"
    }
  end

  def event
    {
      "name"=>"power", "value"=>0.1, "isStateChange"=>false, "displayed"=>false, "linkText"=>"CentraLite Switch (Saeidur)", "descriptionText"=>{"bytes"=>[67, 101, 110, 116, 114, 97, 76, 105, 116, 101, 32, 83, 119, 105, 116, 99, 104, 32, 40, 83, 97, 101, 105, 100, 117, 114, 41, 32, 112, 111, 119, 101, 114, 32, 105, 115, 32, 48, 46, 49], "strings"=>["", " ", " is ", "", ""], "valueCount"=>4, "values"=>["CentraLite Switch (Saeidur)", "power", 0.1, ""]}
    }
  end

  describe "create" do
    it "returns 200" do
      post :create, format: :json, "event" => [temperature_event]
      expect(response.response_code).to eq 201
    end

    it "returns 200" do
      post :create, format: :json, event: event
      expect(response.response_code).to eq 201
    end
  end
end
