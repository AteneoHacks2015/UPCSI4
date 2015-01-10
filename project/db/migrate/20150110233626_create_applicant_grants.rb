class CreateApplicantGrants < ActiveRecord::Migration
  def change
    create_table :applicant_grants do |t|
      t.integer :app_id
      t.integer :sch_id
    end
  end
end
