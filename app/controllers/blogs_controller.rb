class BlogsController < ApplicationController
	before_action :authenticate_user!

  def index
    @blogs = Blog.page(params[:page]).reverse_order
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def see
  end

  def create
    @blog = Blog.new(blog_params)
    redirect_to '/blogs'
  end

  def look
  end

  def browse
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :name)
  end
end
