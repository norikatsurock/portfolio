class AdminController < ApplicationController

	def adminblogs
		@blogs = Blog.all
	end

	def adminalbums
		@albums = Album.all
	end
end
