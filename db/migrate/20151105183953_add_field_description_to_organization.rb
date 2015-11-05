class AddFieldDescriptionToOrganization < ActiveRecord::Migration
  def change
  	add_column :organizations, :description, :text
  end
end
