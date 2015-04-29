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

class ProcessedEvent < ActiveRecord::Base
  validates_presence_of :user_id, :timestamp

  #Validations
  before_validation :set_lux_value
  before_validation :set_temperature_value
  before_validation :set_humdity_value

  def devices
    case user_id
    when 1 #margaret
      devices = ["Open/Closed Door (Margaret)", "Aeon Multisensor (Margaret)",  "CentraLite Switch (Margaret)"]
    when 2 #irvan
      devices = ["Open/Closed Door (Irvan)", "Aeon Multisensor (Irvan)", "CentraLite Switch (Irvan)"]
    when 3  #flora
      devices = ["CentraLite Switch (Flora)", "Aeon Multisensor (Flora)", "Open/Closed Door (Flora)"]
    when 4 #saidur
      devices = ["Aeon Multisensor (Saeidur)", "CentraLite Switch (Saeidur)"]
    end

    return devices
  end

  def events
    Event.where('display_name IN (?)', devices)
  end

  def types
    ["battery", "switch", "motion", "illuminance", "humidity", "contact", "power", "temperature"]
  end

  def second_difference(start_time, end_time)
    elapsed_seconds = (end_time - start_time).to_i
  end

  private

  def construct_queries(sensor_type, attribute)
    collection = events.where(sensor_type: sensor_type)
    events.where(sensor_type: 'temperature')
    previous_event = collection.where('created_at < ?', timestamp).order(created_at: :desc).first
    current_event = collection.find_by_created_at(timestamp)
    future_event = collection.where('created_at > ?', timestamp).order(created_at: :asc).first

    if current_event
      eval("self.#{attribute} = #{current_event.value}")
    else
      return unless previous_event || future_event
      gap = second_difference(previous_event.created_at, future_event.created_at)
      diff = second_difference(previous_event.created_at, timestamp)
      result = (((gap - diff) * previous_event.value.to_f) + (diff * future_event.value.to_f)) / gap
      eval("self.#{attribute} = #{result}")
    end
  end

  def set_lux_value
    construct_queries('illuminance', :lux_value)
  end

  def set_temperature_value
    construct_queries('temperature', :temperature_value)
  end

  def set_humdity_value
    construct_queries('humidity', :humidity_value)
  end
end
