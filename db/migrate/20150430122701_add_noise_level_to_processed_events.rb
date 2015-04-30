class AddNoiseLevelToProcessedEvents < ActiveRecord::Migration
  def change
    add_column :processed_events, :noise_level, :integer
  end
end
