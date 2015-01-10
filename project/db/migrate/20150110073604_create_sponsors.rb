class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :institution_name
      t.string :add_id
      t.integer :contact_num
    end
  end
end

=begin
	Sponsor
		s_id
		institution_name
		add_id (location)
		contact_num
		email_add
=end
