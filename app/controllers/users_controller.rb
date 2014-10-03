class UsersController < ApplicationController
  before_filter :redirect_to_login_if_not_signed_in

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    #review this part
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = "invalid password of email"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
  #
  # def edit
  #   @user = User.find(params[:id])
  #   render :edit
  # end

  # def update
  #   @user = User.find(param[:id])
  #
  #   if@user.update
  #   else
  #     flash[:errors] = "invalid username or name"
  #   end
  # end
  #
  # def destroy
  #
  # end


  private

  def user_params
    params.require(:user).permit(:email, :password )
  end
end
