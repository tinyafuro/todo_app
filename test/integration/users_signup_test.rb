require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  #無効なユーザー登録に対するテスト
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", password: "foo", password_confirmation: "bar"}}
    end
    assert_select 'form[action="/signup"]'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'   
  end

  #有効なユーザー登録に対するテスト
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { name: "Example User", password: "password", password_confirmation: "password"}}
    end
    follow_redirect!  #POSTリクエストを送信した結果を見て、指定されたリダイレクト先に移動するメソッド
    assert_template 'users/show' 
    assert_not flash.empty?
  end

end
