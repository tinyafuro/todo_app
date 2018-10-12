require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", password: "foobar", password_confirmation: "foobar")
  end

  #Userオブジェクトの有効性テスト
  test "should be valid" do
    assert @user.valid?
  end

  #name属性の存在性テスト
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  #name属性文字数上限テスト
  test "name should not be too long" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end

  #name属性の一意性テスト
  test "name should be unique" do
    duplicate_user = @user.dup
    duplicate_user.name = @user.name.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  #name属性小文字化に対するテスト
  test "name should be saved as lower-case" do
    mixed_case_name = "FooBar"
    @user.name = mixed_case_name
    @user.save
    assert_equal mixed_case_name.downcase, @user.reload.name
  end

  #パスワードが空でないテスト
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  #パスワード最小文字数テスト
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
