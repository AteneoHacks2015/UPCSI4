class ApplicantsController < ApplicationController

	def index
		@scholarships = Scholarship.all
		@sp_sch = Array.new
		@scholarships.each do |x|
			@sp_sch.push(SponsorScholarshipJoin.where(sch_id:x.id).first)
		end
		@sponsors = Array.new
		@sp_sch.each do |x|
			@sponsors.push(Sponsor.where(id:x.sp_id).first)
		end
	end

	def new
		@tag = params[:tag].to_i
		@gender_options = ["Male","Female"]
		@level_options = ["High School", "College"]
	end

	def create
		@account = Accounts.new(accounts_params)
		@applicant = Applicant.new(applicant_params)

		if @account.valid? and @applicant.valid?
			@address = Address.new(address_params)
			if @address.valid?
				@account.save
				@address.save
				@applicant.accounts_id = @account.id
				@applicant.add_id = @address.id
				@applicant.save
				redirect_to login_accounts_path
			else
				flash[:error] = @address.errors.full_messages.first
				redirect_to new_applicant_path(@account.tag)
			end
		else
			flash[:error] = (not @account.valid?) ? @account.errors.full_messages.first : @applicant.errors.full_messages.first
			redirect_to new_applicant_path(@account.tag)
		end
	end

	def profile
		@user = Applicant.where(accounts_id:current_user.id).first
		@add = Address.where(id:@user.add_id).first
		@address = @add.block + " " + @add.street + " " + @add.municipality + ", " + @add.province + " " + @add.region
	end

	def apply
		@user = Applicant.where(accounts_id:current_user.id).first
		@sch_id = params[:sch_id]
		@app_sch = ApplicantScholarshipJoin.create(app_id:@user.id,sch_id:@sch_id)

		@scholarship = Scholarship.where(id:@sch_id).first
		@scholarship.demand += 1
		@scholarship.save

		redirect_to :root
	end

	private
		def accounts_params
			params.require(:accounts).permit(:tag, :username, :email, :password, :password_confirmation)
		end

		def applicant_params
			params.require(:applicant).permit(:name, :gender, :contact_num, :institution, :age, :level, :degree_program)
		end

		def address_params
			params.require(:address).permit(:region, :province, :municipality, :street, :block)
		end

end
