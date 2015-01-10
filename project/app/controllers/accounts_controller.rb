class AccountsController < ApplicationController

	def login
	end

	def signin
	end

	def logout
		session[:user_id] = nil
		flash[:notice] = "You have been signed out."
		redirect_to :root		
	end

end
