class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :time_in_office #I spent alot of time in this room 0 - 10
      t.integer :temperate_value #This room is hot today
      t.integer :audio_value  #This room is noisey today
      t.integer :comfort_value #I feel comfortable in this room
      t.text :comment

      t.timestamps null: false
    end
  end
end
