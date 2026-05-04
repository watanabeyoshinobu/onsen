class Api::V1::BlogsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    # クチコミは「新しい順」に見たいので、orderを使って並び替え
    blogs = Blog.order(created_at: :desc)
    
    render json: blogs.map { |blog|
      blog.as_json.merge(name: blog.user&.name || "ゲスト")
    }
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
      render json: { message: '削除が完了しました' }, status: :ok
    else
      render json: { error: '削除に失敗しました' }, status: :unprocessable_entity
    end
  end

end