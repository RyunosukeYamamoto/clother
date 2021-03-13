class PostRelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = current_user.posts.find(params[:post_id])
    cloth = current_user.cloths.find(params[:cloth_id])
    post.add_cloth(cloth)
    flash[:success] = '追加！'
    redirect_to edit_post_path(post)
  end

  def destroy
    post = current_user.posts.find(params[:post_id])
    cloth = current_user.cloths.find(params[:cloth_id])
    post.delete_cloth(cloth)
    flash[:success] = 'コーデから削除'
    redirect_to edit_post_path(post)
  end
end
