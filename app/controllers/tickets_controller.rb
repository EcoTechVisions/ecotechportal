class TicketsController < ApplicationController
	def create
		@new_ticket = Ticket.create()
		respond_to do |format|
	      if @new_ticket.save
	        format.js { }
	      else
	        format.html { render :index }
	        format.json { render json: @new_group.errors, status: :unprocessable_entity }
	      end
	    end
	end
end
