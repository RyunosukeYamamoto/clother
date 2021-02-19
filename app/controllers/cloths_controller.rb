class ClothsController < ApplicationController
  before_action :correct_user, only: [:destroy]
  before_action :require_user_logged_in, except: [:show]
  
  def show
    @cloth = Cloth.find(params[:id])
  end

  def new
    @cloth = current_user.cloths.build  # form_with 用
    @cloths = current_user.cloths.order(id: :desc).page(params[:page])
  end

  def create
    @cloths = current_user.cloths.order(id: :desc).page(params[:page])
    @cloth = current_user.cloths.build(cloth_params)
    
    if @cloth.save
      flash[:success] = '服を登録しました。'
      redirect_to @cloth
    else
      flash.now[:warning] = '服を登録できませんでした。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @cloth.destroy
    flash[:success] = "服を削除しました。"
    redirect_to root_url
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
