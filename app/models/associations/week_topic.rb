class Associations::WeekTopic < ApplicationRecord
	belongs_to :week
	belongs_to :topic
end
