namespace :energy do

  desc "processes_events"
  task :process_events => :environment do
    hours = ENV['hours'].to_i if ENV['hours']
    if hours.present?
      minutes = hours * 60
      ap beginning_time = DateTime.now.beginning_of_hour - hours.minutes

      (0..minutes).each do |m|
        events = ProcessedEvent.create([
          {user_id: 1, timestamp: beginning_time + m.minutes},
          {user_id: 2, timestamp: beginning_time + m.minutes},
          {user_id: 3, timestamp: beginning_time + m.minutes},
          {user_id: 4, timestamp: beginning_time + m.minutes}
        ])
      end
    else
      puts "Please specify how many hours ago"
    end

  end

end