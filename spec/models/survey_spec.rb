require 'rails_helper'

RSpec.describe Survey, :type => :model do
  it "valid factory" do
    survey = build(:survey)
    expect(survey).to be_valid
  end
end
