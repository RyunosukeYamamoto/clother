class CategoriesController < ApplicationController
    def create
      @category = current_user.categories.build(category_params)
      
      if @category.save
        flash[:success] = '新規カテゴリーを追加しました。'
      else
        flash[:danger] = 'カテゴリーを追加できません。'
      end
      redirect_to new_cloth_url
    end
    
    def destroy
    end
    
    private
    
    def category_params
      params.require(:category).permit(:name)
    end
end
