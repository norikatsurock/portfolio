class Blog < ApplicationRecord
	attachment :image
	default_scope -> {order(created_at: :desc)}
	belongs_to :category
	has_many :blogcomments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	# belongs_to :user

	def favorited_by? user
		favorites.where(user_id: user.id).exists?
	end

end
