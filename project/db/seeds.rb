# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i = 0
while i < 5
	gender = (i%2 == 0) ? 'Male' : 'Female'
	level = (i%2 == 0) ? 'High School' : 'College'
	account = Accounts.create tag: 0, username:'applicant'+i.to_s, email:'applicant'+i.to_s+'@gmail.com', password:'password'
	address = Address.create region:'Central Luzon', province:'Bulacan', municipality:'Plaridel', street:'Granite', block:'#19'
	applicant = Applicant.create accounts_id:account.id, name:'applicant'+i.to_s, gender:gender, add_id:address.id, contact_num:'09221234567', institution:'UPD', age:19, level:level, degree_program:'BS CS'		
	i = i+1
end

