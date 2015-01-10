class SponsorsController < ApplicationController

	def new
		@name = params[:name]
		@username = params[:username]
		@email = params[:email]
		@tag = params[:tag]
	end

	def create
		@account = Accounts.new(accounts_params)
		@user = Sponsor.new(sponsor_params)

		if @account.valid?
			render plain: params[:accounts].inspect
		else
			flash[:error] = @account.errors.full_messages.first
		end
	end

	private
		def accounts_params
			params.require(:accounts).permit(:tag, :username, :email, :password, :password_confirmation)
		end

		def sponsor_params
			params.require(:sponsor).permit(:institution_name, :contact_num)
		end

end
