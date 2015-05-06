# == Schema Information
#
# Table name: weathers
#
#  id          :integer          not null, primary key
#  temperature :float
#  timestamp   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Weather < ActiveRecord::Base
  validates_presence_of :temperature, :timestamp
  validates_uniqueness_of :timestamp

  def self.fetch(year, month, day)
    url = "http://www.wunderground.com/history/airport/YMML/#{year}/#{month}/#{day}/DailyHistory.html?req_city=Melbourne&req_statename=Victoria&format=1"
    response = Typhoeus.get(url, followlocation: true)

    file = StringIO.new(response.body.gsub("<br />", ""))
    file.readline

    SmarterCSV.process(file).each do |row|
      create(temperature: row[:temperaturec], timestamp: DateTime.parse(row[:dateutc]))
    end
  end
end
