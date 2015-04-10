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

require 'rails_helper'

RSpec.describe Event::SmartThing, :type => :model do

end
