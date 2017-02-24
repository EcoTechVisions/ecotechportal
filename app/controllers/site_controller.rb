class SiteController < ApplicationController

	def resources
		offset = rand(User.count)
		@rand_user = User.offset(offset).first
	end

	def slideshow
		respond_to do |format|
	        format.js { }
	    end
	end

end