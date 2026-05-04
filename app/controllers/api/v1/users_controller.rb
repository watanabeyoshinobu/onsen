class Api::V1::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    users = User.all
    
    # 取得したデータをJSON形式に変換してReact（画面側）に返す
    render json: users
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