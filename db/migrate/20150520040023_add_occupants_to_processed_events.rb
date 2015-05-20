class AddOccupantsToProcessedEvents < ActiveRecord::Migration
  def change
    add_column :processed_events, :occupants, :integer, default: 0
  end
end
