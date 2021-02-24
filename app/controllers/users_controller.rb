class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:destroy, :code, :show]
  
  def show
    @user = User.find(params[:id])
    @category = current_user.categories.build  # for_with用
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

  def destroy
  end
  
  def code
    @user = User.find(params[:id])
    @temps = @user.temps
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
