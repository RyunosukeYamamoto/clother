class ClothsController < ApplicationController
  before_action :require_user_logged_in, except: [:show]
  before_action :correct_user, only: [:destroy]
  
  def show
    @cloth = Cloth.find(params[:id])
  end

  def new
    @cloth = current_user.cloths.build  # form_with 用
  end

  def create
    @cloth = current_user.cloths.build(cloth_params)
    
    if @cloth.save
      flash[:success] = '服を登録しました。'
      redirect_to @cloth
    else
      flash.now[:warning] = '服を登録できませんでした。'
      render :new
    end
  end

  def destroy
    @cloth.destroy
    flash[:success] = "服を削除しました。"
    redirect_to current_user
  end
  
  private
  
  def cloth_params
    params.require(:cloth).permit(:name, :image)
  end
  
  def correct_user
    @cloth = current_user.cloths.find_by(id: params[:id])
    unless @cloth
      redirect_to root_url
    end
  end
end
