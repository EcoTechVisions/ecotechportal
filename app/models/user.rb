class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
	validates_uniqueness_of :username

	has_many :timesheets, dependent: :destroy
	has_many :tickets, dependent: :destroy

	has_many :courses, dependent: :destroy

	has_many :groups
	has_many :students, dependent: :destroy, class_name: 'Associations::Student'
	has_many :classes, through: :students, source: :group
	
	has_many :members, dependent: :destroy, class_name: 'Associations::Member'
	has_many :companies, through: :members, source: :company	

	enum role: [:admin, :staff, :ecopreneur, :student, :ecostudent]
	after_initialize :set_defaults, :if => :new_record?
	after_initialize :init

	def init
		self.role ||= 3 if self.role == nil
	end

	def set_defaults
		self.role ||= 3
		self.auth_token ||= SecureRandom.hex(n=15)
	end

	def profile
		self.photo.blank? ? "/assets/profile.png" : self.photo.url
	end
end
