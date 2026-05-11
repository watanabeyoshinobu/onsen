class Api::V1::BlogsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    blogs = Blog.includes(:user).order(created_at: :desc).page(params[:page]).per(15)
    mapped_blogs = blogs.map { |blog|
      blog.as_json.merge(name: blog.user&.name || "ゲスト")
    }

    render json: {
      blogs: mapped_blogs,
      meta: {
        current_page: blogs.current_page,
        total_pages: blogs.total_pages,
        total_count: blogs.total_count
      }
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