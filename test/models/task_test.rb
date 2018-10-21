require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    #このコードは慣習的に正しくない
    # @task = Task.new(content: "Lorem ipsum", user_id: @user.id)
    @task = @user.tasks.build(content: "Lorem ipsum")
  end

  #taskが有効かどうかのチェックテスト
  test "should be valid" do
    assert @task.valid?
  end

  #user_idの存在性確認テスト
  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end

  #content属性の存在チェックテスト
  test "content should be present" do
    @task.content = "  "
    assert_not @task.valid?
  end

  #content属性の文字数制限テスト
  test "content should bbe at most 100 characters" do
    @task.content = 'a' * 101
    assert_not @task.valid?
  end

  #taskの読み出し順（作成時間の逆順）テスト
  test "order should be most recent first" do
    assert_equal tasks(:most_recent), Task.first
  end

end
