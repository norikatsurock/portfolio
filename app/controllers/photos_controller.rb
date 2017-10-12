class PhotosController < ApplicationController

	def index
		@photos = Photo.all
	end

	def new
  		@photo = Photo.new
  		@photos = Photo.where(album_id: params[:id])
  		@albums = Album.find(params[:id])
	end

	def create
 		@photo = Photo.new(photo_params)
 		@photo.album_id = params[:id]
		@photo.save
    	redirect_to admin_albums_path
	end

	def edit
		@albums = Album.find(params[:id])
		@photo = Photo.where(album_id: params[:id])
	end

	def update
		@photo = Photo.where(album_id: params[:id])
		@photo.album_id = params[:id]
		@photo.update(photo_params)
		redirect_to photos_path
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to admin_albums_path
	end


	private

	def photo_params
		params.require(:photo).permit(:album_id, :image, :remove_image)
	end

end
