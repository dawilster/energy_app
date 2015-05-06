# == Schema Information
#
# Table name: weathers
#
#  id          :integer          not null, primary key
#  temperature :float
#  timestamp   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Weather, :type => :model do
  it "valid factory" do
    weather = build(:weather)
    expect(weather).to be_valid
  end

  describe "self.fetch" do
    it "fetches weather" do
      VCR.use_cassette('weather/valid_weather') do
        expect{
          Weather.fetch(2015, 5, 6)
        }.to change(Weather, :count).by(38)
      end
    end
  end
end
