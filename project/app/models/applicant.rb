class Applicant < ActiveRecord::Base

	has_one :address, :dependent=>:destroy

	validates_presence_of :name
	validates_presence_of :gender
	validates_presence_of :contact_num
	validates_presence_of :institution
	validates_presence_of :age
	validates_numericality_of :age
	validates_presence_of :level

end
