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
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  timestamp         :datetime
#  noise_level       :integer
#

class ProcessedEvent < ActiveRecord::Base

  #Relations
  has_many :surveys, foreign_key: :user_id, primary_key: :user_id

  validates_presence_of :user_id, :timestamp
  validates_uniqueness_of :timestamp, scope: :user_id

  #Validations
  before_validation :set_lux_value
  before_validation :set_temperature_value
  before_validation :set_humdity_value
  before_validation :set_noise_level
  before_validation :set_person_out_value
  before_validation :set_door_closed
  before_validation :set_motion_detected
  before_validation :set_occupants
  before_validation :set_outside_temperature

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

  def self.column_names
    super | ["survey_flag"]
  end

  def second_difference(start_time, end_time)
    elapsed_seconds = ((end_time - start_time) / 60).to_i
  end

  def nearest_surveys
    @surveys ||= surveys
    .order(%{ABS(EXTRACT(EPOCH FROM ('#{timestamp.to_formatted_s(:db)}'::timestamp - created_at))) asc} )
    .where('created_at < ? AND created_at > ?', timestamp + 1.hour, timestamp - 1.hour)
  end

  def nearest_events
    @nearest_events ||= events
    .order(%{ABS(EXTRACT(EPOCH FROM ('#{timestamp.to_formatted_s(:db)}'::timestamp - created_at))) asc} )
    .where('created_at < ? AND created_at > ?', timestamp + 1.hour, timestamp - 1.hour)
  end

  def person_out
    return 'null' if read_attribute(:person_out).nil?
    read_attribute(:person_out)
  end

  def noise_level
    return 'null' if read_attribute(:noise_level).nil?
    read_attribute(:noise_level)
  end

  def event_attributes(columns)
    event_attributes = []
    columns.each do |column|
      event_attributes << self.send(column)
    end
    return event_attributes
  end

  private

  def construct_queries(sensor_type, attribute)
    collection = events.where(sensor_type: sensor_type)
    events.where(sensor_type: 'temperature')
    previous_event = collection.where('created_at < ?', timestamp).order(created_at: :desc).first
    current_event = collection.where('created_at < ? AND created_at > ?', timestamp.beginning_of_minute + 1.minute, timestamp.beginning_of_minute).first
    future_event = collection.where('created_at > ?', timestamp).order(created_at: :asc).first

    if current_event
      eval("self.#{attribute} = #{current_event.value}")
    else
      return if previous_event.nil? || future_event.nil?
      gap = second_difference(previous_event.created_at, future_event.created_at)
      diff = second_difference(previous_event.created_at, timestamp)
      result = (((gap - diff) * previous_event.value.to_f) + (diff * future_event.value.to_f)) / gap
      eval("self.#{attribute} = #{result}")
    end
  end

  def set_motion_detected
    event = nearest_events.first

    if event
      if event.value == 'active'
        self.motion_detected = true
      else
        self.motion_detected = false
      end
    end
    true
  end

  def set_door_closed
    event = events.where(sensor_type: 'contact').where('created_at <= ?', timestamp).order(created_at: :desc).first
    if event
      if event.value == 'closed'
        self.door_closed = true
      else
        self.door_closed = false
      end
    end
    true
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

  def set_occupants
    survey = nearest_surveys.first
    if survey
      self.occupants = survey.occupants
    end
    true
  end

  def set_outside_temperature
    collection = Weather

    previous_weather = collection.where('timestamp < ?', timestamp).order(created_at: :desc).first
    current_weather = collection.where('timestamp < ? AND created_at > ?', timestamp.beginning_of_minute + 1.minute, timestamp.beginning_of_minute).first
    future_weather = collection.where('timestamp > ?', timestamp).order(created_at: :asc).first

    if current_weather
      self.outside_temperature = current_weather.temperature
    else
      return if previous_weather.nil? || future_weather.nil?
      gap = second_difference(previous_weather.timestamp, future_weather.timestamp)
      diff = second_difference(previous_weather.timestamp, timestamp)
      result = (((gap - diff) * previous_weather.temperature) + (diff * future_weather.temperature)) / gap
      self.outside_temperature = result
    end
  end

  def set_person_out_value
    survey = nearest_surveys.first
    if survey
      if survey.in_out == 'in'
        self.person_out = false
      else
        self.person_out = true
      end
    end
    true
  end

  def set_noise_level
    survey = nearest_surveys.first
    self.noise_level = survey.noise_level if survey
  end
end
