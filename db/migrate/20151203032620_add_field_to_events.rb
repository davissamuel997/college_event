class AddFieldToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :latitude, :float
  	add_column :events, :longitude, :float

  	add_column :events, :full_street_address, :text
  end
end
