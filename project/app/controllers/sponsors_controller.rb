class SponsorsController < ApplicationController

	before_filter :deny_access, :unless => :sponsor?

	def new
		@tag = params[:tag].to_i
	end

	def index
		@user = Sponsor.where(accounts_id:current_user.id).first
		@sp_sch = SponsorScholarshipJoin.where(sp_id:@user.id)
		@scholarships = Array.new
		@sp_sch.each do |x|
			@scholarships.push(Scholarship.where(id:x.sch_id).first)
		end
	end

	def create
		@account = Accounts.new(accounts_params)
		@sponsor = Sponsor.new(sponsor_params)

		if @account.valid? and @sponsor.valid?
			@address = Address.new(address_params)
			if @address.valid?
				@account.save
				@address.save
				@sponsor.accounts_id = @account.id
				@sponsor.add_id = @address.id
				@sponsor.save
				redirect_to login_accounts_path
			else
				flash[:error] = @address.errors.full_messages.first
				redirect_to new_sponsor_path(@account.tag)
			end
		else
			flash[:error] = (not @account.valid?) ? @account.errors.full_messages.first : @sponsor.errors.full_messages.first
			redirect_to new_sponsor_path(@account.tag)
		end
	end

	def profile
		@user = Sponsor.where(accounts_id:current_user.id).first
		@add = Address.where(id:@user.add_id).first 
		@address = (not @add.block == nil) ? (@add.block + " ") : ""
		@address += @add.street + " " + @add.municipality + ", " + @add.province + " " + @add.region
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
