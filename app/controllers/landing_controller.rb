class LandingController < ApplicationController
	def home
		redirect_to dashboard_index_path if user_signed_in?
	end
end
