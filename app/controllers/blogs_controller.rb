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
      if @blog.save
        flash[:notice] = "「#{@blog.title}」の感想が投稿されました!"
        redirect_to '/blogs'
      else
        render = 'new'
      end
      
    @tweet = Tweet.new
    @tweet.user_id = current_user.id
      if @tweet.save
        flash[:notice] = "コメントが投稿されました!"
        redirect_back(fallback_location: root_path)
      else
        flash[:notice] = "コメント投稿失敗しました"
        redirect_back(fallback_location: root_path)
      end
  end

  def destroy
    @blog.delete
    flash[:notice] = "「#{@blog.title}」の感想を削除しました!"
    redirect_to blogs_path
  end

  def browse
  end

  def see
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
  end

  def look
    @tweets = Tweet.where(:action_name => action_name)
    @tweet = Tweet.new
  end

  def saw
  end

  def watch
  end

  def seeing
  end

  def looking
  end

  def check
  end

  def try
  end

  def gaze
  end

  def info
  end

  def precautions
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :name).merge(user_id: current_user.id)
    end

    def set_target_blog
      @blog = Blog.find(params[:id])
    end

end
