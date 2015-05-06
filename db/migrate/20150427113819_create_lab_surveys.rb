class CreateLabSurveys < ActiveRecord::Migration
  def change
    create_table :lab_surveys do |t|
      t.integer  :room_id
      t.float    :hours_spent
      t.integer  :temperature_value
      t.integer  :noise_level
      t.integer  :comfort_value
      t.text     :comment
      t.timestamps null: false
    end
  end
end
