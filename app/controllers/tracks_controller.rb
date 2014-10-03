class TracksController < ApplicationController
  before_filter :redirect_to_login_if_not_signed_in

  def new
    if !params[:album_id].nil?
      @track = Track.new(:album_id => params[:album_id])

      @album_name = Album.find(params[:album_id]).name
      @album_object = Album.find(params[:album_id])

    else
      @track = Track.new
    end
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track) #change to specific band page later
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end

  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    #update also need to find the cat
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album)
  end


  private
  def track_params
    params.require(:track).permit(:name, :album_id, :bonus_or_regular)
  end
end
