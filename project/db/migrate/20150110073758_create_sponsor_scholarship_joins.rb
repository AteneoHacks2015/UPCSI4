class CreateSponsorScholarshipJoins < ActiveRecord::Migration
  def change
    create_table :sponsor_scholarship_joins do |t|

      t.timestamps
    end
  end
end
