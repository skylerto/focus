require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in users(:tom)
    @task = tasks(:one)
    @current_user = users(:tom)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { complete: @task.complete, estimated_progress: @task.estimated_progress, progress: @task.progress, title: @task.title }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { complete: @task.complete, estimated_progress: @task.estimated_progress, progress: @task.progress, title: @task.title }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
