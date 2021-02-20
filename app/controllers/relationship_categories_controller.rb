class RelationshipCategoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    category = current_user.categories.find(params[:category_id])
    cloth = current_user.cloths.find(params[:cloth_id])
    cloth.categorize(category)
    flash[:success] = 'カテゴライズしました。'
    redirect_to cloth
  end

  def destroy
    category = current_user.categories.find(params[:category_id])
    cloth = current_user.cloths.find(params[:cloth_id])
    cloth.uncategorize(category)
    flash[:success] = 'カテゴリーから削除しました。'
    redirect_to current_user
  end
end
