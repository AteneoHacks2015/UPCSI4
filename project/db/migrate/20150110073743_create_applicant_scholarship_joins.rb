class CreateApplicantScholarshipJoins < ActiveRecord::Migration
  def change
    create_table :applicant_scholarship_joins do |t|

      t.timestamps
    end
  end
end
