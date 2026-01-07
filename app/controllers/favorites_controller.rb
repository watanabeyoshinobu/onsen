class FavoritesController < ApplicationController

before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.new(blog_id: @blog.id)
    favorite.save
    render json: { status: 'created', count: @blog.favorites.count }
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.find_by(blog_id: @blog.id)
    favorite.destroy
    render json: { status: 'destroyed', count: @blog.favorites.count }
  end
end
