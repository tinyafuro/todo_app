require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  #Userプロフィール画面に対するテスト
  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', @user.name
    assert_select 'h1', text: @user.name
    assert_match @user.tasks.count.to_s, response.body
    assert_select 'div.pagination'
    @user.tasks.paginate(page: 1).each do |task|
      assert_match task.content, response.body
    end
  end

end
