class ScholarshipsController < ApplicationController

	def new
	end

	def create
		render plain: params[:scholarship].inspect
	end

end
