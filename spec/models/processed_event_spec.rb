# == Schema Information
#
# Table name: processed_events
#
#  id                :integer          not null, primary key
#  lux_value         :float
#  temperature_value :float
#  humidity_value    :float
#  door_closed       :boolean
#  power_value       :float
#  motion_detected   :boolean
#  person_out        :boolean
#  timestamp         :datetime
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe ProcessedEvent, :type => :model do
  it "valid factory" do
    event = build(:processed_event)
    expect(event).to be_valid
  end

  describe "before_validations" do
    before :each do
      p_event = build(:processed_event)
    end

    context :lux_value do

      it "if event with same timestamp(minute) exists set to that" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'illuminance', value: "10")
        p_event = create(:processed_event, timestamp: event.created_at)
        expect(p_event.lux_value).to eq event.value.to_f
      end

      it "uses algorithm to calculate value between 2 events" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'illuminance', value: "250", created_at: 5.seconds.ago)
        other_event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'illuminance', value: "300", created_at: event.created_at + 5.seconds)
        p_event = create(:processed_event, timestamp: event.created_at + 4.seconds)
        expect(p_event.lux_value).to eq 290
      end
    end

    context :temperature_value do
      it "if event with same timestamp(minute) exists set to that" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'temperature', value: "26.5")
        p_event = create(:processed_event, timestamp: event.created_at)
        expect(p_event.temperature_value).to eq event.value.to_f
      end

      it "uses algorithm to calculate value between 2 events" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'temperature', value: "26.5", created_at: 5.seconds.ago)
        other_event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'temperature', value: "27", created_at: event.created_at + 5.seconds)
        p_event = create(:processed_event, timestamp: event.created_at + 3.seconds)
        expect(p_event.temperature_value).to eq 26.8
      end
    end

    context :humidity_value do
      it "if event with same timestamp(minute) exists set to that" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'temperature', value: "26.5")
        p_event = create(:processed_event, timestamp: event.created_at)
        expect(p_event.humidity_value).to eq event.value.to_f
      end

      it "uses algorithm to calculate value between 2 events" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'humidity', value: "40", created_at: 5.seconds.ago)
        other_event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'humidity', value: "45", created_at: event.created_at + 5.seconds)
        p_event = create(:processed_event, timestamp: event.created_at + 3.seconds)
        expect(p_event.humidity_value).to eq 43
      end
    end

    context :power_value do
      #uses previous reading unless event exists for current_time
    end

    context :noise_level do
      #nearest survey within an hour
    end

    context :door_closed do
      #uses previous reading unless event exists for current_time
    end

    context :person_out do
      #nearest survey within an hour
    end

  end
end
