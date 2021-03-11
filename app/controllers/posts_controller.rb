class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destory]
  before_action :correct_user, only: [:destroy]
  
  def index
    if logged_in?
      @posts = Post.all
    else
      @posts = Post.all
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
       flash.now[:warning] = '投稿できませんでした'
       render :new
    end
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :description)
  end
  
  def correct_user
  end
end
