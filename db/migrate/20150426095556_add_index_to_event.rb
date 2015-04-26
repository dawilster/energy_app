class AddIndexToEvent < ActiveRecord::Migration
  def change
    add_index :events, :display_name
  end
end
