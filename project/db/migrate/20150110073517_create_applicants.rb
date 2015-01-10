class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
    	t.string :name
    	t.string :gender
    	t.integer :add_id
    	t.string :contact_num
    	t.string :institution
    	t.integer :age
    	t.string :level
    	t.string :degree_program
    end
  end
end
