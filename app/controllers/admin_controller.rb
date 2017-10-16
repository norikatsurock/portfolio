class AdminController < ApplicationController

	def adminblogs
		@blogs = Blog.order("updated_at desc").page(params[:page]).per(15)
	end

	def adminalbums
		@albums = Album.order("updated_at desc").page(params[:page]).per(15)
	end
end
