class ScholarshipsController < ApplicationController

	def new
	end

	def create
		@scholarship = Scholarship.new(scholarships_params)

		if @scholarship.valid?
			#CREATE ACCOUNT
			@scholarship.save
			@user = Sponsor.where(accounts_id:current_user.id).first
			@sponsor_scholarship_join = SponsorScholarshipJoin.create(sp_id:@user.id, sch_id:@scholarship.id)
			redirect_to :root
		else
			#TODO redirect to form
			redirect_to new_scholarship_path('')
		end
	end

	def view
		@id = params[:id]
	end

	private
		def scholarships_params
			params.require(:scholarships).permit(:title, :desc, :slot, :req, :ben, :app_res)
		end

end
