class Scholarship < ActiveRecord::Base
	validates_presence_of :title
	validates_presence_of :desc
	validates_presence_of :slot
	validates_numericality_of :slot
	validates_presence_of :req
	validates_presence_of :ben
end