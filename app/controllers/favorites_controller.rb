class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    article = Article.find_by(id: params[:article_id])
    current_user.like(article)
    flash[:success] = '気になるリストに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    article = Article.find_by(id: params[:article_id])
    current_user.remove_like(article)
    flash[:success] = '気になるリストから削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
