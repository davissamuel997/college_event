class AddEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
    	t.string :name
    	t.integer :university_id

    	t.timestamps
    end

    add_index :event_types, :university_id
  end
end
