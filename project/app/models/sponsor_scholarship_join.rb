class SponsorScholarshipJoin < ActiveRecord::Base

	validates_presence_of :sp_id
	validates_presence_of :sch_id
end
