class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
			t.belongs_to :accounts, index: true   	
      t.string :institution_name
      t.string :add_id
      t.string :contact_num
    end
  end
end