class Blog < ApplicationRecord
	attachment :image
	belongs_to :category
	has_many :blogcomments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true
	validates :category_id, presence: true


	def favorited_by? user
		favorites.where(user_id: user.id).exists?
	end

end
