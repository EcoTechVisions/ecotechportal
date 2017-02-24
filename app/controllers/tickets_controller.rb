class TicketsController < ApplicationController
	def index
		@tickets = []

		case params[:show]
	      when 'my_tickets'
	        filter_ticket(0)
	      when 'assigned_tickets'
	        filter_ticket(1)
	      else
	        @tickets = current_user.tickets.order('id DESC')
	    end

	    @new_ticket = Ticket.new
	end


	def show
		respond_to do |format|
	        format.js { }
	    end
	end


	def create
		@new_ticket = current_user.tickets.build(ticket_params)
		@new_ticket.title = "New Ticket" if params[:ticket][:title].blank?

		respond_to do |format|
	      if @new_ticket.save
			association = @new_ticket.ticket_assignements.build(user_id: current_user.id, role: 0)
		    association.save
	        format.js { }
	      else
	        format.html { render :index }
	        format.json { render json: @new_group.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

	def ticket_params
		params.require(:ticket).permit(:title, :body, :directed_to, :refnum, :status, :viewed)
	end

	def filter_ticket(role)
		ass_tickets = current_user.ticket_assignements.where(role: role)
        ass_tickets.order('id DESC').each do |ass_ticket|
        	@tickets << ass_ticket.ticket
        end
	end
end
