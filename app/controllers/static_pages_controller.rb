class StaticPagesController < ApplicationController

  def home
    #ログイン中の場合はUserページ表示
    if logged_in?
      redirect_to current_user
    end
  end

  def help
  end

  def about
  end
  
end
