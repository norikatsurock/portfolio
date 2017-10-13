class Album < ApplicationRecord
	has_many :photos, dependent: :destroy
	accepts_attachments_for :photos, attachment: :image
end
