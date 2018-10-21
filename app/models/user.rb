class User < ApplicationRecord
	has_many :tasks, dependent: :destroy

	#name属性は小文字に強制変換してから保存
	before_save { name.downcase! }

	#name属性 バリデーション
	validates :name, presence: true, length: {maximum:30}, uniqueness: { case_sensitive: false }

	#セキュアなパスワード設定
	has_secure_password

	#パスワード バリデーション
	validates :password, presence: true, length: { minimum:6 }, allow_nil: true

	#渡された文字列のハッシュ値を返す
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	
end
