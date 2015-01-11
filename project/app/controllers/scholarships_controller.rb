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
		@apply_marker = 0
		if current_user.tag == 0
			@user = Applicant.where(accounts_id:current_user.id).first
			if ApplicantScholarshipJoin.exists?(:app_id => @user.id, :sch_id => @id)
				@apply_marker = 1
			end
		else
			@apply_marker = 1
		end
		@scholarship = Scholarship.where(id:@id).first
	end

	def update
		@scholarship = Scholarship.where(id:params[:accounts][:id]).first
		if @scholarship.valid?
			@scholarship.title = params[:scholarships][:title]
			@scholarship.desc = params[:scholarships][:desc]
			@scholarship.slot = params[:scholarships][:slot]
			@scholarship.demand = params[:scholarships][:demand]
			@scholarship.req = params[:scholarships][:req]
			@scholarship.ben = params[:scholarships][:ben]
			@scholarship.app_res = params[:scholarships][:app_res]
			@scholarship.save
			redirect_to :root
		end

	end

	def approve
		@scholarship = Scholarship.where(id: params[:id]).first
		@join = ApplicantScholarshipJoin.all
	end

	def accept
		@s = Scholarship.where(id:params[:id]).first
		@join = ApplicantScholarshipJoin.where(sch_id:params[:id]).first
		@app = Applicant.where(id:@join.app_id).first
		if @s.slot == 0
			#DO SOMETHING
			
			redirect_to :root
		else
			@s.slot -= 1
			@s.save
			#DO SOMETHING
			ApplicantGrants.create(app_id:@app.id, sch_id:@s.id)
			@join.destroy
			redirect_to :root
		end
	end

	def deny
		@s = Scholarship.where(id: params[:id]).first
		#DO SOMETHING
		@s.destroy
		redirect_to :root
	end

	private
		def scholarships_params
			params.require(:scholarships).permit(:title, :desc, :slot, :req, :ben, :app_res)
		end

end
