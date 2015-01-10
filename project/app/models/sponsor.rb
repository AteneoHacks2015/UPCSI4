class Sponsor < ActiveRecord::Base

	has_one :address, :dependent=>:destroy

	validates_presence_of :institution_name
	validates_presence_of :contact_num

end
