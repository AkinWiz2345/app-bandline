class ArticlesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.order(id: :desc).page(params[:page]).per(25)
  end
  
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = '記事を投稿しました。'
      redirect_to @article
    else
      @user = current_user
      flash.now[:danger] = '記事の投稿に失敗しました。'
      render :new
    end
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def show
    @article = Article.find_by(id: params[:id])
  end
  
  def update
    if @micropost.update(article_params)
      flash[:success] = 'Micropostは正常に更新されました'
      redirect_to @article
    else
      flash[:danger] = 'Micropostは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to current_user
  end
  
  private

  def article_params
    params.require(:article).permit(:heading, :introduction)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      flash[:danger] = '権限がありません。'
      redirect_back(fallback_location: root_path)
    end
  end
end
