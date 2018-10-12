class User < ApplicationRecord

    #name属性は小文字に強制変換してから保存
    before_save { name.downcase! }

    #name属性 バリデーション
    validates :name, presence: true, length: {maximum:20}, uniqueness: { case_sensitive: false }

    #セキュアなパスワード設定
    has_secure_password

    #パスワード バリデーション
    validates :password, presence: true, length: { minimum:6}
end
