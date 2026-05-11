class Api::V1::TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    tweets = Tweet.includes(:user).order(created_at: :desc).page(params[:page]).per(10)

    render json: {
      tweets: tweets.as_json(include: :user),
      meta: {
        current_page: tweets.current_page,
        total_pages: tweets.total_pages,
        total_count: tweets.total_count
      }
    }
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      render json: { message: 'つぶやきを削除しました' }, status: :ok
    else
      render json: { error: '削除に失敗しました' }, status: :unprocessable_entity
    end
  end
end