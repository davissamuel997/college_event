class ChangeFields < ActiveRecord::Migration
  def change
  	remove_column :events, :category_id
  	add_column :events, :event_type_id, :integer

  	add_index :events, :event_type_id
  end
end
