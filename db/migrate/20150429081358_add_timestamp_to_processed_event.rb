class AddTimestampToProcessedEvent < ActiveRecord::Migration
  def change
    add_column :processed_events, :timestamp, :datetime
  end
end
