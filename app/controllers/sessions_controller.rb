class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    if current_user.sample == true
      if current_user.articles
        current_user.articles.all.each do |a|
          a.destroy
        end
      end
      if current_user.favorites
        current_user.favorites.all.each do |f|
          f.destroy
        end
      end
      if current_user.rooms
        current_user.rooms.all.each do |r|
          r.destroy
        end
      end
    end
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
