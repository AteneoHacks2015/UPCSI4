class CreateSponsorScholarshipJoins < ActiveRecord::Migration
  def change
    create_table :sponsor_scholarship_joins do |t|
    	t.integer :sp_id
    	t.integer :sch_id
    end
  end
end
