# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  display_name :string
#  sensor_type  :string
#  value        :string
#  state        :boolean
#  user_id      :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# Events are generated 2 ways
# - through a smart_things device
# - submitted through the iOS app attached to a Feedback object

class Event < ActiveRecord::Base
  validates_presence_of :sensor_type, :display_name, :value
end
