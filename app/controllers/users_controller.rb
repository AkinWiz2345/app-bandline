class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :logged_in?, only: [:create, :new, :edit, :update]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end

  
  def show
    @user = User.find(params[:id])
    @band_article = @user.articles.find_by(kind: 'band')
    @member_article = @user.articles.find_by(kind: 'member')
    
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールは正常に更新されました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザは更新されませんでした'
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :birthday, :area, :image, :introduction)
  end
end
