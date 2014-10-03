class AlbumsController < ApplicationController
  before_filter :redirect_to_login_if_not_signed_in

  def new
    if !params[:band_id].nil?
      @album = Album.new(:band_id => params[:band_id])
      @band_name = Band.find(params[:band_id]).name
      @band_object = Band.find(params[:band_id])

    else
      @album = Album.new
    end
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album) #change to specific band page later
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end

  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    #update also need to find the cat
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band)
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :live_or_studio)
  end
end
