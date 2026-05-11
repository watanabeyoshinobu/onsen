class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    comments = Comment.includes(:user).order(created_at: :desc).page(params[:page]).per(10)

    render json: {
      comments: comments.as_json(include: :user),
      meta: {
        current_page: comments.current_page,
        total_pages: comments.total_pages,
        total_count: comments.total_count
      }
    }
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render json: { message: 'コメントを削除しました' }, status: :ok
    else
      render json: { error: '削除に失敗しました' }, status: :unprocessable_entity
    end
  end
end