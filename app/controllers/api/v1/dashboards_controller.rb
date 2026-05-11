class Api::V1::DashboardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    today_favorites = begin
      Favorite.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
    rescue
      0
    end

    total_blogs = Blog.count
    total_users = User.count

    blogs = Blog.includes(:user).order(created_at: :desc).page(params[:blog_page]).per(5)
    latest_blogs = blogs.map { |blog|
      blog.as_json.merge(name: blog.user&.name || "ゲスト")
    }

    comments = Comment.includes(:user).order(created_at: :desc).page(params[:comment_page]).per(5)
    latest_comments = comments.map { |comment|
      comment.as_json.merge(name: comment.user&.name || comment.name || "退会済みユーザー")
    }

    tweets = Tweet.includes(:user).order(created_at: :desc).page(params[:tweet_page]).per(5)
    latest_tweets = tweets.map { |tweet|
      tweet.as_json.merge(name: tweet.user&.name || "退会済みユーザー")
    }

    render json: {
      today_favorites_count: today_favorites,
      total_blogs_count: total_blogs,
      total_users_count: total_users,
      latest_blogs: latest_blogs,
      latest_comments: latest_comments,
      latest_tweets: latest_tweets,
      blog_meta: {
        current_page: blogs.current_page,
        total_pages: blogs.total_pages,
        total_count: blogs.total_count
      },
      comment_meta: {
        current_page: comments.current_page,
        total_pages: comments.total_pages,
        total_count: comments.total_count
      },
      tweet_meta: {
        current_page: tweets.current_page,
        total_pages: tweets.total_pages,
        total_count: tweets.total_count
      }
    }
  end
end