class CreateOrganizationUsers < ActiveRecord::Migration
  def change
    create_table :organization_users do |t|
    	t.integer :user_id
    	t.integer :organization_id
    	t.timestamps
    end

    add_index :organization_users, :user_id
    add_index :organization_users, :organization_id
  end
end
