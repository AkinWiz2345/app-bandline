class ArticlesController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :check_number_of_band, only: [:band_create, :band_new]
  before_action :check_number_of_member, only: [:member_create, :member_new]
  
  def index
    @articles = Article.order(id: :desc).page(params[:page]).per(25)
  end
  
  def band
    @articles = Article.where(kind: 'band').order(id: :desc).page(params[:page]).per(25)
  end
  
  def member
    @articles = Article.where(kind: 'member').order(id: :desc).page(params[:page]).per(25)
  end
  
  def band_create
    @article = current_user.articles.build(article_params)
    @article.kind = 'band'
    if @article.save
      flash[:success] = '記事を投稿しました。'
      redirect_to @article
    else
      @user = current_user
      flash.now[:danger] = '記事の投稿に失敗しました。'
      render :band_new
    end
  end
  
  def member_create
    @article = current_user.articles.build(article_params)
    @article.kind = 'member'
    @article.gender = current_user.gender
    @article.age = current_user.age
    @article.area = current_user.area
    @article.introduction = current_user.introduction
    @article.image = current_user.image
    @article.parts = current_user.parts
    if @article.save
      flash[:success] = '記事を投稿しました。'
      redirect_to @article
    else
      @user = current_user
      @parts_of_member = @article.parts
      flash.now[:danger] = '記事の投稿に失敗しました。'
      render :member_new
    end
  end
  
  def band_new
    @article = Article.new
  end
  
  def member_new
    @article = Article.new
    @parts_of_member = current_user.parts.all.map { |h| h[:name] }
  end
  
  def edit
  end
  
  def show
    @article = Article.find_by(id: params[:id])
    @parts_of_band = @article.parts.all.order(:id).map { |h| h[:name] }
    @parts_of_member = @article.user.parts.all.order(:id).map { |h| h[:name] }
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = '記事は正常に更新されました'
      redirect_to @article
    else
      flash[:danger] = '記事は更新されませんでした'
      render :show
    end
  end

  def destroy
    @article.destroy
    flash[:success] = '記事を削除しました。'
    redirect_to current_user
  end
  
  private

  def article_params
    params.require(:article).permit(:heading, :introduction, :gender, :minimum_age, :maximum_age, :age, :area, :image, part_ids: [])
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      flash[:danger] = '権限がありません。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def check_number_of_band
    if current_user.articles.where(kind: 'band').count >= 1
      flash[:danger] = 'バンドメンバー募集記事は1つまでしか投稿できません'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def check_number_of_member
    if current_user.articles.where(kind: 'member').count >= 1
      flash[:danger] = 'メンバー加入希望記事は1つまでしか投稿できません'
      redirect_back(fallback_location: root_path)
    end
  end
end
