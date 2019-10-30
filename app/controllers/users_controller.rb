class UsersController < ApplicationController
  before_action :require_user_logged_in, only: :show
  before_action :correct_user, only: [:edit, :update, :destroy, :likes]
  
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
    @user = User.find_by(id: params[:id])
    @band_article = @user.articles.find_by(kind: 'band')
    @member_article = @user.articles.find_by(kind: 'member')
    @parts = @user.parts.all.order(:id).map { |h| h[:name] }
    
    current_user_entries = Entry.where(user_id: current_user.id)
    user_entries = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      current_user_entries.each do |cu|
        user_entries.each do |u|
          if cu.room_id == u.room_id
            @room =  Room.find_by(id: cu.room_id)
          end
        end
      end
    end
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
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :birthday, :area, :image, :introduction, part_ids: [])
  end
  
  def correct_user
    @user = User.find_by(id: params[:id])
    unless current_user == @user
      flash[:danger] = '権限がありません'
      redirect_back(fallback_location: root_path)
    end
  end
end
