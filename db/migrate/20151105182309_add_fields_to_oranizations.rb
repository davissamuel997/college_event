class AddFieldsToOranizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :is_active, :boolean, :default => false
  end
end
