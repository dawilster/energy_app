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
  attr_accessor :date, :time

  before_validation :convert_date_time

  def short_timestamp
    created_at.to_formatted_s(:short).to_s
  end

  private

  def convert_date_time
    if date.present? && time.present?
      self.created_at = self.updated_at = Time.zone.parse("#{date} #{time} Melbourne")
    end
  end

end
