class AddFieldToUniversity < ActiveRecord::Migration
  def change
  	add_column :universities, :user_id, :integer

  	add_index :universities, :user_id
  end
end
