class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.favo(post)
    flash[:success] = 'ファボ!'
    redirect_to post
  end
  
  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavo(post)
    flash[:success] = 'アンファボ!'
    redirect_to post
  end
end
