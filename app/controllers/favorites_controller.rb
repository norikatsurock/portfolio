class FavoritesController < ApplicationController
	before_action :authenticate_user!
	def create
		@blog = Blog.find(params[:blog_id])
		@favorite = current_user.favorites.build(blog: @blog)
		@favorite.save
		redirect_to blog_path(params[:blog_id])
	end

	def destroy
		@favorite = current_user.favorites.find_by!(blog: params[:blog_id])
		@favorite.destroy
		redirect_to blog_path(params[:blog_id])
	end
end
