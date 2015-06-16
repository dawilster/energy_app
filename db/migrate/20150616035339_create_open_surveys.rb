class CreateOpenSurveys < ActiveRecord::Migration
  def change
    create_table :open_surveys do |t|
      t.string :location
      t.integer :happy_level
      t.integer :excited_level
      t.integer :safe_level
      t.integer :peace_level
      t.text :comment

      t.timestamps null: false
    end
  end
end
