class AddColumnsToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :comment, :text
    add_column :surveys, :in_out, :string
  end
end
