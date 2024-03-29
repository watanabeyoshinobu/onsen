class BlogsController < ApplicationController
	before_action :authenticate_user!, except: %i[browse]
  before_action :set_target_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.page(params[:page]).reverse_order
  end

  def show
    # @comment = Comment.new(blog_id: @blog.id)
    @blog = Blog.includes(:user).find(params[:id])
    @comments = @blog.comments
    @comment = Comment.new
    @tweets = @blog.tweets
    @tweet = Tweet.new
  end

  def new
    @blog = Blog.new(flash[:board])
  end

  def edit

  end

  def update
    @blog.update(blog_params)
    flash[:notice] = "「#{@blog.title}」の感想を更新しました!"
    redirect_to blog_path
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.image = params[:blog][:image] if params[:blog_image_update_flg].present?

      if @blog.save
        flash[:notice] = "「#{@blog.title}」の感想が投稿されました!"
        redirect_to '/blogs'
      else
        render = 'new'
      end
      

  end

  def destroy
    @blog.delete
    flash[:notice] = "「#{@blog.title}」の感想を削除しました!"
    redirect_to blogs_path
  end

  def browse
  end

  def look
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def see
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def saw
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def watch
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def seeing
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def looking
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def check
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def try
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def gaze
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def info
  end

  def precautions
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :name, :image).merge(user_id: current_user.id)
    end

    def set_target_blog
      @blog = Blog.find(params[:id])
    end

end
