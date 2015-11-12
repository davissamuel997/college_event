class AddFieldsToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :address, :string
  	add_column :events, :postal_code, :string
  	add_column :events, :latitude, :string
  	add_column :events, :longitude, :string
  	add_column :events, :state, :string
  	add_column :events, :country, :string
  end
end
