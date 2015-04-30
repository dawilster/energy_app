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

  describe "nearest_survey" do
    it "returns survey with nearest timestamp" do
      p_event = create(:processed_event)
      survey2 = create(:survey, noise_level: 5, created_at: 11.minutes.ago)
      survey = create(:survey, noise_level: 5, created_at: 10.minutes.from_now)
      survey3 = create(:survey, noise_level: 5, created_at: 25.minutes.ago)
      expect(p_event.nearest_surveys).to eq [survey, survey2, survey3]
    end
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
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'illuminance', value: "250", created_at: 5.minutes.ago)
        other_event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'illuminance', value: "300", created_at: event.created_at + 5.minutes)
        p_event = create(:processed_event, timestamp: event.created_at + 4.minutes)
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
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'temperature', value: "26.5", created_at: 5.minutes.ago)
        other_event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'temperature', value: "27", created_at: event.created_at + 5.minutes)
        p_event = create(:processed_event, timestamp: event.created_at + 3.minutes)
        expect(p_event.temperature_value).to eq 26.8
      end
    end

    context :humidity_value do
      it "if event with same timestamp(minute) exists set to that" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'humidity', value: "26.5")
        p_event = create(:processed_event, timestamp: event.created_at)
        expect(p_event.humidity_value).to eq event.value.to_f
      end

      it "uses algorithm to calculate value between 2 events" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'humidity', value: "40", created_at: 5.minutes.ago)
        other_event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'humidity', value: "45", created_at: event.created_at + 5.minutes)
        p_event = create(:processed_event, timestamp: event.created_at + 3.minutes)
        expect(p_event.humidity_value).to eq 43
      end
    end

    context :motion_detected do
      it "if event with same timestamp(minute) exists set to that" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'motion', value: "active")
        p_event = create(:processed_event, timestamp: event.created_at)
        expect(p_event.motion_detected).to eq true
      end

      it "uses previous event if no surveys found for timestamp" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'motion', value: "inactive", created_at: 10.minutes.ago)
        p_event = create(:processed_event)
        expect(p_event.motion_detected).to eq false
      end
    end

    context :noise_level do
      it "uses survey if its within an hour of results" do
        survey = create(:survey, noise_level: 5, created_at: 25.minutes.ago)
        p_event = create(:processed_event)
        expect(p_event.noise_level).to eq 5
      end

      it "if no survey within hour long window sets to nil" do
        create(:survey, noise_level: 5, created_at: 2.hours.from_now)
        create(:survey, noise_level: 5, created_at: 61.minutes.ago)

        p_event = create(:processed_event)
        expect(p_event.noise_level).to eq nil
      end
    end

    context :door_closed do
      #uses previous reading unless event exists for current_time
      it "if event with same timestamp(minute) exists set to that" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'contact', value: "closed")
        p_event = create(:processed_event, timestamp: event.created_at)
        expect(p_event.door_closed).to eq true
      end

      it "uses previous event if no surveys found for timestamp" do
        event = create(:event, display_name: "Aeon Multisensor (Margaret)", sensor_type: 'contact', value: "open", created_at: 10.minutes.ago)
        p_event = create(:processed_event)
        expect(p_event.door_closed).to eq false
      end
    end

    context :person_out do
      it "uses survey if its within an hour of results" do
        survey = create(:survey, in_out: 'in', created_at: 25.minutes.ago)
        p_event = create(:processed_event)
        expect(p_event.person_out).to eq false
      end

      it "parses 'in' to false correctly" do
        survey = create(:survey, in_out: 'in', created_at: 25.minutes.ago)
        p_event = create(:processed_event)
        expect(p_event.person_out).to eq false
      end

      it "parses 'out' to true " do
        survey = create(:survey, in_out: 'out', created_at: 25.minutes.ago)
        p_event = create(:processed_event)
        expect(p_event.person_out).to eq true
      end

      it "if no survey within hour long window sets to nil" do
        create(:survey, noise_level: 5, created_at: 2.hours.from_now)
        create(:survey, noise_level: 5, created_at: 61.minutes.ago)

        p_event = create(:processed_event)
        expect(p_event.person_out).to eq nil
      end
    end

    context :power_value do
      #uses previous reading unless event exists for current_time
    end

  end

  describe "validations" do

    it "cannot create 2 p_events with same timestamp and same user_id" do
      p_event = create(:processed_event)
      other_p_event = build(:processed_event, user_id: p_event.user_id, timestamp: p_event.timestamp)
      expect(other_p_event).to_not be_valid
    end

    it "multiple can exist at timestamp if user_id is different" do
      p_event = create(:processed_event)
      other_p_event = build(:processed_event, user_id: p_event.user_id + 1, timestamp: p_event.timestamp)
      expect(other_p_event).to be_valid
    end

  end
end
