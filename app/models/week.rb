class Week < ApplicationRecord
	has_many :course_weeks, dependent: :destroy, class_name: 'Associations::CourseWeek'
	has_many :courses, through: :course_weeks, source: :course

	has_many :week_topics, dependent: :destroy, class_name: 'Associations::WeekTopic'
	has_many :topics, through: :week_topics, source: :topic
end
