class BlogsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@blogs = Blog.all
  end

  def show
  end

  def new
  end

  def edit
  end
  def see
  end
end
