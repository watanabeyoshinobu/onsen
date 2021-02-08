class UsersController < ApplicationController
  def show
  	@user = current_user
  end

  def index
  end

  def edit
  end

  def update
  	@user.update(user_params)
    flash[:notice] = "「#{@user.name}」の登録を更新しました!"
    redirect_to users_show_path
  end

  def withdraw
  end

end
