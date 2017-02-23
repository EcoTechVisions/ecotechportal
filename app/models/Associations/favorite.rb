class Associations::Favorite < ApplicationRecord
	belongs_to :favorable, polymorphic: :true
	belongs_to :topic
end
