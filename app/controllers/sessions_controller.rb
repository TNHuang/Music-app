class SessionsController < ApplicationController
  before_filter :redirect_to_bands_index_if_signed_in, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user.nil?
      #review this part
      flash[:errors] = "Incorrect email or password"
      @user = User.new(email: params[:user][:email])

      render "sessions/new.html.erb"
    else
      login!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end
end
