class ApplicantsController < ApplicationController

	def new
		@name = params[:name]
		@username = params[:username]
		@email = params[:email]
		@tag = params[:tag]
		@account_id = (Accounts.last != nil) ? Accounts.last+1:1 
	end

	def create
		@account = Accounts.new(accounts_params)

		if @account.valid?
			render plain: params[:accounts].inspect
		else
			flash[:error] = @account.errors.full_messages.first
		end
	end

	private
		def accounts_params
			params.require(:accounts).permit(:username, :email, :password, :password_confirmation)
		end

end
