class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.integer :sc_id
      t.string :title
      t.string :desc
      t.integer :slot
      t.string :req
      t.string :ben
      t.string :app_res
      t.timestamps
    end
  end
end

=begin
	
	Scholarships
		sc_id
		title
		desc
		slot
		req
		ben
		app_res
=end
