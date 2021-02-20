class TempsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @temps = current_user.temps
  end

  def create
    @temp = current_user.temps.build(temp_params)
    
    if @temp.save
      flash[:success] = "気温パターンを追加しました。"
      redirect_to temps_url
    else
      flash[:danger] = "気温パターンを追加できません。"
      redirect_to temps_url
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @temp.destroy
    flash[:success] = "気温パターンを削除しました。"
    redirect_to temps_url
  end
  
  private
  
  def temp_params
    params.require(:temp).permit(:max, :min)
  end
  
  def correct_user
    @temp = current_user.temps.find_by(id: params[:id])
    unless @temp
      redirect_to root_url
    end
  end
end
