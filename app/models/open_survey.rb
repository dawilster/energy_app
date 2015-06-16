# == Schema Information
#
# Table name: open_surveys
#
#  id            :integer          not null, primary key
#  location      :string
#  happy_level   :integer
#  excited_level :integer
#  safe_level    :integer
#  peace_level   :integer
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class OpenSurvey < ActiveRecord::Base
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
