# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


account = Accounts.create tag: 0, username:'applicant2', email:'applicant2@gmail.com', password:'password'

i = 0
while i < 5
	account = Accounts.create tag: 0, username:'applicant'+i.to_s, email 'applicant'+i.to_s+'@gmail.com', password:'password'
	
	i = i+1
end