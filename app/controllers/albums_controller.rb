class AlbumsController < ApplicationController
  def index
    @albums = policy_scope(Album)
  end

  def show
    @album = Album.find(params[:id])
    authorize @album
  end

  def new
    @album = Album.new
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    authorize @album
    if @album.save
      unless params[:pics].nil?
        params[:pics]["photo"].each do |p|
          @album.pictures.create(photo: p)
        end
      end
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    authorize @album
  end

  def update
    @album = Album.find(params[:id])
    authorize @album
    if @album.update(album_params)
      unless params[:pics].nil?
        params[:pics]["photo"].each do |p|
          @album.pictures.create(photo: p)
        end
      end
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    authorize @album
    @album.destroy
    redirect_to xxx_path
  end

  private

  def album_params
    params.require(:album).permit(:title, :content, :rating, :destination_id)
  end
end
