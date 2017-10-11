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
		@photo.save
    	redirect_to photos_path
	end


	private

	def photo_params
		params.require(:photo).permit(:album_id, :image, :remove_image)
	end

end
