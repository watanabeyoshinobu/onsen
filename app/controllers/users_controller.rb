class UsersController < ApplicationController
  before_action :authenticate_user!

  def show_modal
    @comment = Comment.find(params[:id])
  end

  def show
    @user = current_user
  end

  def index
  end

  def edit
  	@user = User.find(params[:id])
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
    @user = User.find(params[:id])

    if params[:user_profile_image_update_flg].present?
      @user.update_attribute(:profile_image, params[:user][:profile_image])
    else
      @user.update!(user_params)
    end
    redirect_to user_path(@user.id)


  end

  def withdraw
  end

  def follows
  end

  def followers
  end

  def set_variables
    @blog = Blog.find(params[:blog_id])
    @id_name = "#blog-link-#{@blog.id}"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
    end

    def user_profile_image_params
      params.require(:user).permit(:profile_image)
    end
end
