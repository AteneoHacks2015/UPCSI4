class ScholarshipsController < ApplicationController

	def new
	end

	def create
		render plain: params[:scholarships].inspect
	end

end
