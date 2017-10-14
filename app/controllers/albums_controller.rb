
class AlbumsController < ApplicationController

	def index
		@albums = Album.all.page(params[:page]).per(8)
		@photos = Photo.all
	end

	def new
  		@album = Album.new
	end

	def create
 		@album = Album.new(album_params)
		@album.save
    	redirect_to albums_path
	end

	def show
		@album = Album.find(params[:id])
	end

	def edit
		@album = Album.find(params[:id])
  		@photo = Photo.new
  		@photos = Photo.where(album_id: params[:id])
	end

	def update
		@album = Album.find(params[:id])
		@album.update(album_params)
		redirect_to admin_albums_path
	end


	def destroy
		@album = Album.find(params[:id])
		@album.destroy
		redirect_to admin_albums_path
	end

	private

	def album_params
		params.require(:album).permit(:title, :date, :place, photos_images:[])
	end

	def photo_params
		params.require(:photo).permit(:image)
	end


end
