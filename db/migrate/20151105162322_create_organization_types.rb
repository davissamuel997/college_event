class CreateOrganizationTypes < ActiveRecord::Migration
  def change
    create_table :organization_types do |t|
    	t.string :name
    	t.text :description

    	t.timestamps
    end
  end
end
