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
#

require 'rails_helper'

RSpec.describe Survey, :type => :model do
  it "valid factory" do
    survey = build(:survey)
    expect(survey).to be_valid
  end
end
