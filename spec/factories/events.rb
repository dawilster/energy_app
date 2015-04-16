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

FactoryGirl.define do
  factory :event do
    display_name "test"
    sensor_type "test"
    value "10"
  end
end
