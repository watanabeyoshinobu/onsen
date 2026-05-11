class Api::V1::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    users = User.page(params[:page]).per(15)
    
    render json: {
      users: users,
      meta: {
        current_page: users.current_page,
        total_pages: users.total_pages,
        total_count: users.total_count
      }
    }
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { message: 'ユーザーを削除しました' }, status: :ok
    else
      render json: { error: '削除に失敗しました' }, status: :unprocessable_entity
    end
  end

end