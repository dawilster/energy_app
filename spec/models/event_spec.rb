require 'rails_helper'

RSpec.describe Event, :type => :model do
  it "valid factory" do
    event = build(:event)
    expect(event).to be_valid
  end
end
