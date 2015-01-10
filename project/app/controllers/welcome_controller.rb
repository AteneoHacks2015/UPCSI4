class WelcomeController < ApplicationController

	def index
		if current_user
			redirect_to (current_user.tag == 0 ? applicants_path : sponsors_path)
		end
	end

end