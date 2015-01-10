Accounts.create!([
  {tag: 0, username: "applicant1", email: "applicant1@gmail.com", password_hash: "$2a$10$vsFKsbMlR3sg3gX1k8OaE.HZAGMdNeRN67nS2ZVbal.SOsX6PyH2m", password_salt: "$2a$10$vsFKsbMlR3sg3gX1k8OaE."},
  {tag: 1, username: "sponsor1", email: "sponsor1@gmail.com", password_hash: "$2a$10$hmcwSFn6aYKWKuYnbXvpNe72P4LYJ.HJYR4T8hm3E7LAGMZ8fyfxa", password_salt: "$2a$10$hmcwSFn6aYKWKuYnbXvpNe"}
])
Address.create!([
  {region: "RegionA", province: "ProvinceB", municipality: "MunC", street: "StreetD", block: "BlockE"},
  {region: "Reg", province: "Pro", municipality: "Mu", street: "Str", block: "Blo"}
])
Applicant.create!([
  {accounts_id: 1, name: "Derpina", gender: "Female", add_id: 1, contact_num: "09123456789", institution: "UP", age: 69, level: "College", degree_program: "BS COMPUTER SCIENCE"}
])
Scholarship.create!([
  {title: "Derp Scholarship", desc: "Scholarship for women", slot: 69, demand: 0, req: "Must be hot", ben: "Service for women", app_res: "female only"}
])
Sponsor.create!([
  {accounts_id: 2, institution_name: "UP Scholarships", add_id: "2", contact_num: "09987654321"}
])
SponsorScholarshipJoin.create!([
  {sp_id: 2, sch_id: 1}
])
