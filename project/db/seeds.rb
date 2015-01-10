# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


applicant_list = []
i = 0
while i < 5
	gender = (i%2 == 0) ? 'Male' : 'Female'
	level = (i%2 == 0) ? 'High School' : 'College'
	account = Accounts.create tag: 0, username:'applicant'+i.to_s, email:'applicant'+i.to_s+'@gmail.com', password:'password'
	address = Address.create region:'Central Luzon', province:'Bulacan', municipality:'Plaridel', street:'Granite', block:'#19'
	applicant = Applicant.create accounts_id:account.id, name:'applicant'+i.to_s, gender:gender, add_id:address.id, contact_num:'09221234567', institution:'UPD', age:19, level:level, degree_program:'BS CS'		
	applicant_list << applicant
	i = i+1
end


sponsor_list = []
scholarship_list = []
i = 0
while i < 10
	account = Accounts.create tag: 1, username:'sponsor'+i.to_s, email:'sponsor'+i.to_s+'@gmail.com', password:'password'
	address = Address.create region:'NCR', province:'Quezone City', municipality:'Loyola Heights', street:'Katipunan'
	
	sponsor = Sponsor.create  accounts_id:account.id, institution_name:'sponsor'+i.to_s, add_id:address.id, contact_num:'09123456789'
	scholarship = Scholarship.create title:'Scholarship '+i.to_s, desc:sponsor.institution_name+'\'s scholarship', slot: 1, demand:0, req: sponsor.institution_name+'\'s requirements', ben: sponsor.institution_name+'\'s benefits', app_res: 'women only'
	
	sponsor_scholarship_join = SponsorScholarshipJoin.create sp_id: sponsor.id, sch_id: scholarship.id
	applicant_scholarship_join = ApplicantScholarshipJoin.create app_id: nil, sch_id: scholarship.id	
	
	sponsor_list << sponsor
	scholarship_list << scholarship

	i = i+1
end

for i in applicant_list
	num = rand(scholarship_list.length)
	scholarship = scholarship_list[num]
	applicant_scholarship_join = ApplicantScholarshipJoin.where(sch_id: scholarship.id).first

	#puts applicant_scholarship_join[:app_id]
	#puts i.id
	
	applicant_scholarship_join[:app_id] = i.id
	applicant_scholarship_join.save
	
	#puts applicant_scholarship_join[:app_id]
	scholarship_list.delete_at(num)
end


#scholarship = Scholarship.create title:'scholarship'+i.to_s, desc:'Scholarship offer number '+i.to_s, slot: i, demand: i + 10, req: "hot", ben: "money", app_res: "female only"
