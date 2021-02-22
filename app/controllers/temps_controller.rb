class TempsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    @temp = Temp.find(params[:id])
  end
  
  def new
    @temp = current_user.temps.build
  end

  def create
    @temp = current_user.temps.build(temp_params)
    
    if @temp.save
      flash[:success] = "気温パターンを追加しました。"
      redirect_to code_user_url(current_user)
    else
      flash.now[:danger] = "気温パターンを追加できません。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @temp.destroy
    flash[:success] = "気温パターンを削除しました。"
    redirect_to code_user_url(current_user)
  end
  
  private
  
  def temp_params
    params.require(:temp).permit(:max, :min, :name)
  end
  
  def correct_user
    @temp = current_user.temps.find_by(id: params[:id])
    unless @temp
      redirect_to root_url
    end
  end
end
