class AddFieldToOrganization < ActiveRecord::Migration
  def change
  	add_column :organizations, :organization_type_id, :integer

  	add_index :organizations, :organization_type_id
  end
end
