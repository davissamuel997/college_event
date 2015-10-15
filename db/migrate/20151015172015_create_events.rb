class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name
    	t.integer :category_id
    	t.text :description
    	t.time :start_time
    	t.date :date
    	t.string :contact_phone
    	t.string :contact_email

    	t.integer :university_id

    	t.timestamps
    end

    add_index :events, :university_id
    add_index :events, :category_id
  end
end