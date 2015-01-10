class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.integer :tag
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt    	
      t.timestamps
    end
  end
end
