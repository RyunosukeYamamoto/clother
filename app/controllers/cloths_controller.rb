class ClothsController < ApplicationController
  def show
    @cloth = Cloth.find(params[:id])
  end

  def new
    @cloth = current_user.cloths.build  # form_with 用
    @cloths = current_user.cloths.order(id: :desc).page(params[:page])
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

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def cloth_params
    params.require(:cloth).permit(:name, :image)
  end
end
