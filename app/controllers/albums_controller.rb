class AlbumsController < ApplicationController
	before_action :set_album, only:[:index, :indexdate,:indexdate2, :indexplace, :indexplace2]

	def index
		@albums = Album.order('date desc').page(params[:page]).per(20)
	end

	def indexdate
		@albums = Album.all.order('date desc')
		@date = params[:date]
	end

	def indexdate2
		@albums = Album.all.order('date desc')
	end

	def indexplace
		@albums = Album.where(place: params[:place]).order('date desc')
		@album_place = params[:place]
	end

	def indexplace2
		@albums = Album.all.order('date desc')
	end

	def new
  		@album = Album.new
	end

	def create
 		@album = Album.new(album_params)
		@album.save
    	redirect_to admin_albums_path
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
		redirect_to edit_album_path(params[:id])
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

	def set_album
		@photos = Photo.all
		@places = Album.group("place").pluck(:place)
		album = Album.group("date").order('date desc').pluck(:date)
		date = album.map{|date| date.strftime("%Y年%m月")}
		@dates = date.uniq
	end


end
