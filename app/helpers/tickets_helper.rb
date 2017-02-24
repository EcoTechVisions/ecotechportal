module TicketsHelper
	def ticket_direct
		['Management', 'Bootcamp', 'Alumni', 'Finance', 'Social Media']
	end
	def ticket_selected
		case current_user.role
		when 'student' 
			selected = ticket_direct[1]
		else
			selected = ticket_direct[0]
		end

		selected
	end

	def ticket_status(ticket)
		status = 'blank' if ticket.status == 0
		status = 'blue' if ticket.status == 1
		status = 'grey' if ticket.status == 2

		assignement = ticket.ticket_assignements.find_by(user_id: current_user.id, role: 1)

		if assignement
			status = 'red' if !assignement.viewed
		end
		

		status
	end
end
