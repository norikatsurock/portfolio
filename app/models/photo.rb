class Photo < ApplicationRecord
	belongs_to :album
	attachment :image

	validates :image_id, presence: true
end
