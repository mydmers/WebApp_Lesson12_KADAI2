class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    u = current_user
    m = Micropost.find(params[:micropost_id])
    u.like(m)       
    flash[:success] = '投稿をお気に入りにしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    u = current_user
    m = Micropost.find(params[:id])
    u.unlike(m)       
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
  
end