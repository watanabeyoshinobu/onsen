class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def index
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
   	else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "「#{@user.name}」を変更しました！"
      redirect_to users_show_path
    else
      render 'new'
    end
  end

  def update
  	@user =User.find(params[:id])
  	if @user.update_attributes(user4_params)
  	flash[:success] = "「#{@user.name}」を更新しました！"
  	redirect_to users_edit_path
  	else
  		render 'edit'
  	end
  end

  def withdraw
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
    end

end
