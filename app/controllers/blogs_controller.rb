class BlogsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def see
  end

  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to '/blogs'
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
