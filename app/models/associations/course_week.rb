class Associations::CourseWeek < ApplicationRecord
	belongs_to :course
	belongs_to :week
end
