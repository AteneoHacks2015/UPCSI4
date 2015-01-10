class AccountsController < ApplicationController

	def login
		if current_user == nil
			@account = Accounts.new
		else
		end		
	end

	def signin
	end

	def logout
		session[:user_id] = nil
		flash[:notice] = "You have been signed out."
		redirect_to :root		
	end

end
