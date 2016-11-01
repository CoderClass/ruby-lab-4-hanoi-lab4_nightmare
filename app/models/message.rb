class Message < ApplicationRecord
	belongs_to :room
	validates :content, presence: true

	def username_or_guest
		name || "Guest"
	end
end
