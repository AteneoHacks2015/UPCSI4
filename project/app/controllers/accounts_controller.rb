class AccountsController < ApplicationController

	def login
		if current_user == nil
			@account = Accounts.new
		else
		end		
	end

	def signin
		username = params[:user][:username]
		password = params[:user][:password]

		user = Accounts.authenticate(username, password)

		if user
			session[:user_id] = user.id
			@user = (current_user.tag == 0) ? Applicant.where(accounts_id:current_user.id).first : Sponsor.where(accounts_id:current_user.id).first
			redirect_to (current_user.tag == 0 ? applicants_path : sponsors_path)
		else
			flash[:error] = "Please check you username or password."
			redirect_to login_accounts_path
		end				
	end

	def logout
		session[:user_id] = nil
		flash[:notice] = "You have been signed out."
		redirect_to :root		
	end

end
