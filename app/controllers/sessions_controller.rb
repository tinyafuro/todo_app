class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      #ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      # redirect_to user
      redirect_back_or user
    else
      #エラーメッセージを作成する
      flash.now[:danger] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
