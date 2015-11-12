class AddFieldToOrgTypes < ActiveRecord::Migration
  def change
  	add_column :organization_types, :university_id, :integer

  	add_index :organization_types, :university_id
  end
end
