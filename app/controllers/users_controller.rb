class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:destroy, :code, :show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(16)
  end

  def new
    @user = User.new  #form_with 用
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザ情報は正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ情報は更新されませんでした'
      render :edit
    end
  end

  def destroy
  end
  
  def code
    @user = User.find(params[:id])
    @temps = @user.temps
  end
  
  def closet
    @user = User.find(params[:id])
    if @user == current_user
      @category = current_user.categories.build  # for_with用
    end
  end
  
  def following
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(5)
  end
  
  def follower
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(5)
  end
  
  def favo
    @user = User.find(params[:id])
    @favo = @user.favoposts.page(params[:page]).per(5)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city)
  end
  
  def correct_user
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      redirect_to root_url
    end
  end
end
