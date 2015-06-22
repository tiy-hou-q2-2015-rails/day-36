class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order("created_at desc")
  end

  def open
    @photo = Photo.find params[:id]
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new params.require(:photo).permit(:url)
    @photo.save
    @photos = Photo.all.order("created_at desc")
  end
end
