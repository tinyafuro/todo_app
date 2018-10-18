module SessionsHelper

	#渡されたユーザーでログインする
	def log_in(user)
		#一時cookiesを作成するsessionメソッド
		session[:user_id] = user.id
	end

	#渡されたユーザーがログイン済みユーザーであればtrueを返す
	def current_user?(user)
		user == current_user
	end

	#現在ログイン中のユーザーを返す（いる場合９
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	#ユーザーがログインしていればtrue、その他ならfalseを返す
	def logged_in?
		!current_user.nil?
	end

	#ログインしてるユーザーが管理者権限であればtrue
	def admin_check?
		current_user.admin?
	end

	# 現在のユーザーをログアウトする
	def log_out
	session.delete(:user_id)
	@current_user = nil
	end

	#記憶したURL（もしくはデフォルト値）にリダイレクト
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	#アクセスしようとしたURLを覚えておく
	def store_location
		session[:forwarding_url] = request.original_url if request.get?
	end

end
