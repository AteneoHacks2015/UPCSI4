class ApplicantsController < ApplicationController

	def new
		@tag = params[:tag]
	end

	def create
		@account = Accounts.new(accounts_params)
		#@applicant = Applicant.new(applicant_params)

		if @account.valid? #and @applicant.valid?
			render plain: params[:accounts].inspect
		else
			flash[:error] = (not @account.valid?) ? @account.errors.full_messages.first : @applicant.errors.full_messages.first
			redirect_to new_applicant_path(@account.tag)
		end
	end

	private
		def accounts_params
			params.require(:accounts).permit(:tag, :username, :email, :password, :password_confirmation)
		end

		def applicant_params
			params.require(:applicant).permit(:name, :gender, :contact_num, :institution, :age, :level)
		end

end
