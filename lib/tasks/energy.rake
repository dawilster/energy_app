namespace :energy do

  desc "processes_events"
  task :process_events => :environment do
    hours = ENV['hours'].to_i if ENV['hours']
    if hours.present?
      minutes = hours * 60
      beginning_time = DateTime.now.beginning_of_hour - hours.minutes

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

  desc "process events from last processed til now"
  task :schedule_event_processing => :environment do
    last_event = ProcessedEvent.last
    if last_event
      minutes = minute_difference(last_event.timestamp, Time.now)
      (1..minutes).each do |m|
        events = ProcessedEvent.create([
          {user_id: 1, timestamp: last_event.timestamp + m.minutes},
          {user_id: 2, timestamp: last_event.timestamp + m.minutes},
          {user_id: 3, timestamp: last_event.timestamp + m.minutes},
          {user_id: 4, timestamp: last_event.timestamp + m.minutes}
        ])
      end
    end
  end

end

def minute_difference(start_time, end_time)
  elapsed_seconds = ((end_time - start_time) / 60).to_i
end