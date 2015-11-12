class ChangeTables < ActiveRecord::Migration
  def change
  	if table_exists? :organization_types
  		drop_table :organization_types
  	end

  	create_table :event_statuses do |t|
    	t.string :name
    	t.text :description
    	t.integer :university_id

    	t.timestamps
  	end

	  add_index :event_statuses, :university_id

	  add_column :events, :event_status_id, :integer
	  add_index :events, :event_status_id
  end
end

