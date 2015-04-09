require 'rails_helper'

RSpec.describe Feedback, :type => :model do
  it "valid factory" do
    feedback = build(:feedback)
    expect(feedback).to be_valid
  end
end
