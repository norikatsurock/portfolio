class Blogcomment < ApplicationRecord
	belongs_to :blog
	belongs_to :user

	validates :comment, presence: true
end
