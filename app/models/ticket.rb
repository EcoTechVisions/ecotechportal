class Ticket < ApplicationRecord

	has_many :ticket_assignements, dependent: :destroy, class_name: 'Associations::TicketAssignement'
	has_many :users, through: :ticket_assignements, source: :user

	after_initialize :set_defaults, :if => :new_record?

	def set_defaults
		self.refnum ||= "T_"+SecureRandom.hex(n=3)
		self.status ||= 0
	end

end