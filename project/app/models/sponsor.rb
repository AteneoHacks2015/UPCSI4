class Sponsor < ActiveRecord::Base
	validates_presence_of :institution_name
	validates_presence_of :contact_num
end
