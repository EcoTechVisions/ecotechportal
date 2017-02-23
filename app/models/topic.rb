class Topic < ApplicationRecord
	has_many :week_topics, dependent: :destroy, class_name: 'Associations::WeekTopic'
	has_many :weeks, through: :week_topics, source: :week
end
