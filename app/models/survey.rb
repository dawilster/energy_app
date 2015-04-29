# == Schema Information
#
# Table name: surveys
#
#  id                :integer          not null, primary key
#  occupants         :integer
#  temperature_value :integer
#  noise_level       :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  comment           :text
#  in_out            :string
#

# Survey submissions are from the web app
class Survey < ActiveRecord::Base
end
