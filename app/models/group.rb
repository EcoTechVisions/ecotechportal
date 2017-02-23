class Group < ApplicationRecord
	has_many :group_courses, dependent: :destroy, class_name: 'Associations::GroupCourse'
	has_many :courses, through: :group_courses, source: :course

	has_many :students, dependent: :destroy, class_name: 'Associations::Student'
	has_many :users, through: :students, source: :user
end
