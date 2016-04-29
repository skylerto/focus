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
      post :create, params: { task: { complete: @task.complete, estimated_progress: @task.estimated_progress, progress: @task.progress, title: @task.title }}
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, params: {id: @task}
    if @current_user.id != @task.id
      assert_response :redirect
    else
      assert_response :success
    end
  end

  test "should get edit" do
    get :edit, params: {id: @task}
    if @current_user.id != @task.id
      assert_response :redirect
    else
      assert_response :success
    end
  end

  test "should update task" do
    patch :update, params: {id: @task, task: { complete: @task.complete, estimated_progress: @task.estimated_progress, progress: @task.progress, title: @task.title }}
    if @current_user.id != @task.id
      assert_response :redirect
    else
      assert_redirected_to task_path(assigns(:task))
    end

  end

  test "should destroy task" do
    if @current_user.id != @task.id
      assert_response :ok
    else
      assert_difference('Task.count', -1) do
        delete :destroy, params: { id: @task}
      end
      assert_redirected_to tasks_path
    end
  end
end
