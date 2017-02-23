class Course < ApplicationRecord
	has_many :course_weeks, dependent: :destroy, class_name: 'Associations::CourseWeek'
	has_many :weeks, through: :course_weeks, source: :week

	has_many :group_courses, dependent: :destroy, class_name: 'Associations::GroupCourse'
	has_many :groups, through: :group_courses, source: :group
end
