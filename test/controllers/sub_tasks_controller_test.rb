require 'test_helper'

class SubTasksControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in users(:tom)
    @sub_task = sub_tasks(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get :index, params: {:task_id => @task.id, :id => @sub_task.id}

    assert_redirected_to tasks_path
    # assert_not_nil assigns(:sub_tasks)
  end

## => TODO
  test "should get new" do
    # get :new, :task_id => @task, :id => @sub_task
    # get :new
    # assert_response :success
  end

  ## => TODO
  test "should create sub_task" do
    # assert_difference('SubTask.count') do
    #   post :create, sub_task: {  }
    # end
    #  sub_task_path(assigns(:sub_task))
  end

  ## => TODO
  test "should show sub_task" do
    # get :show, :task_id => @task, :id => @sub_task
    # if @current_user != @task
    #   assert_response :redirect
    # else
    #   assert_response :success
    # end
    # # get :show, id: @sub_task
  end

  test "should get edit" do
    # get(:edit, {:task_id => @sub_task.task_id}, {:id => @sub_task.id})
    # # get :edit, id: @sub_task
    # assert_response :success
  end

  test "should update sub_task" do
    # if @current_user.id != @task.id
    #   assert_response :redirect
    # else
    #   patch :update, task_id: @task.id, id: @sub_task, sub_task: {  }
    # end
    # assert_redirected_to sub_task_path(assigns(:sub_task))
  end

  test "should destroy sub_task" do
  #   assert_difference('SubTask.count', -1) do
  #     delete :destroy, id: @sub_task
  #   end
  #   assert_redirected_to sub_tasks_path
  end
end
