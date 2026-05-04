class Api::V1::DashboardsController < ApplicationController
  def index
    today_favorites = begin
      Favorite.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
    rescue
      0
    end

    total_blogs = Blog.count
    total_users = User.count

    latest_blogs = Blog.order(created_at: :desc).limit(5).map { |blog|
      blog.as_json.merge(name: blog.user&.name || "ゲスト")
    }

    render json: {
      today_favorites_count: today_favorites,
      total_blogs_count: total_blogs,
      total_users_count: total_users,
      latest_blogs: latest_blogs
    }
  end
end