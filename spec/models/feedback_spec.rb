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

require 'rails_helper'

RSpec.describe Feedback, :type => :model do
  it "valid factory" do
    feedback = build(:feedback)
    expect(feedback).to be_valid
  end
end
