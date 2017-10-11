class Album < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	has_many :photos, dependent: :destroy
	accepts_attachments_for :photos, attachment: :image
end
