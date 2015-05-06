# == Schema Information
#
# Table name: lab_surveys
#
#  id                :integer          not null, primary key
#  room_id           :integer
#  hours_spent       :float
#  temperature_value :integer
#  noise_level       :integer
#  comfort_value     :integer
#  comment           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class LabSurvey < ActiveRecord::Base
end
