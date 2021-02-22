class RelationshipTempsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    temp = current_user.temps.find(params[:temp_id])
    category = current_user.categories.find(params[:category_id])
    temp.add_category(category)
    flash[:success] = '気温パターンにカテゴリーを追加しました'
    redirect_to temp
  end
  
  def destroy
    temp = current_user.temps.find(params[:temp_id])
    category = current_user.categories.find(params[:category_id])
    temp.delete_category(category)
    flash[:success] = '気温パターンからカテゴリーを削除しました'
    redirect_to temp
  end
end
