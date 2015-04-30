set :environment, ENV['RAILS_ENV']
set :output, {:error => 'error.log', :standard => 'cron.log'}
env :PATH, ENV['PATH']

every 6.hours do
  rake "energy:schedule_event_processing"
end
