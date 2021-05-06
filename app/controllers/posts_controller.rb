class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destory]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(16)
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
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = '投稿が編集されました'
      redirect_to @post
    else
      flash.now[:danger] = '投稿は編集されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :description)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
