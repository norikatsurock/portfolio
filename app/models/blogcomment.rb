class Blogcomment < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	belongs_to :blog
	belongs_to :user
end
