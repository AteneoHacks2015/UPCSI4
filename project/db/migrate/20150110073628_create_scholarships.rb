class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.string :title
      t.text :desc
      t.integer :slot
      t.integer :demand, default: 0
      t.text :req
      t.text :ben
      t.text :app_res
      t.timestamps
    end
  end
end