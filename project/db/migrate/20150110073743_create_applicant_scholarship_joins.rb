class CreateApplicantScholarshipJoins < ActiveRecord::Migration
  def change
    create_table :applicant_scholarship_joins do |t|
    	t.integer :app_id
    	t.integer :sch_id
    end
  end
end
