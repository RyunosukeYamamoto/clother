class TempsController < ApplicationController
  before_action :require_user_logged_in
  
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
  end
  
  private
  
  def temp_params
    params.require(:temp).permit(:max, :min)
  end
end
