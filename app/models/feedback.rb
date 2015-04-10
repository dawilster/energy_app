# == Schema Information
#
# Table name: feedbacks
#
#  id              :integer          not null, primary key
#  time_in_office  :integer
#  temperate_value :integer
#  audio_value     :integer
#  comfort_value   :integer
#  comment         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# Feedback is the users feelings submitted through the iOS app
class Feedback < ActiveRecord::Base
end
