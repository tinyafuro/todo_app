require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  #rootへのGetレスポンステスト
  test "should get home" do
    get root_url
    assert_response :success;
    assert_select "title", "Home"
  end

  #static/helpへのGetレスポンステスト
  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help"
  end

  #static/aboutへのGetレスポンステスト
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About"
  end

end
