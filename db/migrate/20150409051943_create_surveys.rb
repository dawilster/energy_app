class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :occupants
      t.integer :temperature_value
      t.integer :noise_level

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
