class UsersController < ApplicationController
  before_action :authenticate_user!

def show_modal
    if params[:tweet_id].present?
      @comment = Tweet.find_by(id: params[:tweet_id])
    else
      @comment = Comment.find_by(id: params[:comment_id])
    end

    if @comment.present?
      respond_to :js
    else
      logger.error "Modal object not found. params: #{params.inspect}"
      render status: 404
    end
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
        if params[:user].present?
          @user.update_attribute(:profile_image, params[:user][:profile_image])
          redirect_to user_path(@user)
        else
          redirect_to edit_user_path(@user), alert: "画像が選択されていません"
        end
        else
          @user.update!(user_params)
          redirect_to user_path(@user)
        end
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
