class BandsController < ApplicationController
  before_filter :redirect_to_login_if_not_signed_in

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save

      redirect_to bands_url #change to specific band page later
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end

  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    #update also need to find the cat
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] << @band.errors.full_messages
      render :edit
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
