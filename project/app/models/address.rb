class Address < ActiveRecord::Base

	validates_presence_of :region
	validates_presence_of :province
	validates_presence_of :municipality
	validates_presence_of :street

end
