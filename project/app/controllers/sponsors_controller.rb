class SponsorsController < ApplicationController

	def new
		@tag = params[:tag]
	end

	def create
		@account = Accounts.new(accounts_params)
		@sponsor = Sponsor.new(sponsor_params)

		if @account.valid? and @sponsor.valid?
			@address = Address.new(address_params)
			if @address.valid?
				render plain: params[:sponsor].inspect
			else
				flash[:error] = @address.errors.full_messages.first
				redirect_to new_sponsor_path(@account.tag)
			end
		else
			flash[:error] = (not @account.valid?) ? @account.errors.full_messages.first : @sponso.errors.full_messages.first
			redirect_to new_sponsor_path(@account.tag)
		end
	end

	private
		def accounts_params
			params.require(:accounts).permit(:tag, :username, :email, :password, :password_confirmation)
		end

		def sponsor_params
			params.require(:sponsor).permit(:institution_name, :contact_num)
		end

		def address_params
			params.require(:address).permit(:region, :province, :municipality, :street, :block)
		end

end
