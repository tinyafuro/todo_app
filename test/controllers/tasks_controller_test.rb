require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  def setup
    @task = tasks(:orange)
  end

  #ログイン済みでない場合にTask投稿できない確認テスト
  test "should redirect create when not logged in" do
    assert_no_difference 'Task.count' do
      post tasks_path, params:{ task: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  #Task削除時のテスト
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Task.count' do
      delete task_path(@task)
    end
    assert_redirected_to login_url
  end

  #間違ったユーザーによるTask削除に対するテスト
  test "should redirect destroy for wrong task" do
    log_in_as(users(:michael))
    task = tasks(:ants)
    assert_no_difference 'Task.count' do
      delete task_path(task)
    end
    assert_redirected_to root_url
  end

end
