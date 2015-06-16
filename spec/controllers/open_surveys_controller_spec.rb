require 'rails_helper'

RSpec.describe Api::V1::OpenSurveysController, :type => :controller do

  describe "create" do
    it "returns 200" do
      post :create, format: :json, open_survey: attributes_for(:open_survey)
      expect(response.response_code).to eq 201
    end
  end
end
