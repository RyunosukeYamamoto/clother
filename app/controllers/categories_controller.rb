class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
    def create
      @category = current_user.categories.build(category_params)
      
      if @category.save
        flash[:success] = '新規カテゴリーを追加しました。'
      else
        flash[:danger] = 'カテゴリーを追加できません。'
      end
      redirect_to @category.user
    end
    
    def destroy
      @category.destroy
      flash[:success] = 'カテゴリーを削除しました。'
      redirect_to current_user
    end
    
    private
    
    def category_params
      params.require(:category).permit(:name)
    end
    
    def correct_user
      @category = current_user.categories.find_by(id: params[:id])
      unless @category
        redirect_to root_url
      end
    end
end
