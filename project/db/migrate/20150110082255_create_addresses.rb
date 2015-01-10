class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.belongs_to :applicant, index: true
    	t.belongs_to :sponsor, index: true
      t.string :region
      t.string :province
      t.string :municipality
      t.string :street
      t.string :block
    end
  end
end
