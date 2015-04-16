require 'rails_helper'

RSpec.describe Api::V1::SurveysController, :type => :controller do

  describe "create" do
    it "returns 200" do
      post :create, format: :json, survey: attributes_for(:survey)
      expect(response.response_code).to eq 201
    end
  end
end
