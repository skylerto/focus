class SubTasksController < ApplicationController
  before_action :set_sub_task, only: [:show, :edit, :update, :destroy]
  layout 'admin'


  # GET /sub_tasks
  # GET /sub_tasks.json
  def index
    # @sub_tasks = SubTask.all(:include => :title)
    redirect_to :tasks
  end

  # GET /sub_tasks/1
  # GET /sub_tasks/1.json
  def show
  end

  # GET /sub_tasks/new
  def new
    @sub_task = SubTask.new
    @task = Task.find_by_id(params[:task_id])
  end

  # GET /sub_tasks/1/edit
  def edit
    @task = Task.find_by_id(params[:task_id])
    @sub_task = SubTask.find_by_id(params[:id])
  end

  # POST /sub_tasks
  # POST /sub_tasks.json
  def create
    @task = Task.find_by_id(params[:task_id])
    @sub_task = @task.sub_tasks.create(sub_task_params)

    respond_to do |format|
      if @sub_task.save
        format.html { redirect_to @task, notice: 'Sub task was successfully created.' }
        format.json { render :show, status: :created, location: @sub_task }
      else
        format.html { render :new }
        format.json { render json: @sub_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_tasks/1
  # PATCH/PUT /sub_tasks/1.json
  def update
    @task = Task.find_by_id(params[:task_id])


    respond_to do |format|
      if @sub_task.update(sub_task_params)
        format.html { redirect_to task_sub_task_url(:task_id => @task.id, :id => @sub_task.id), notice: 'Sub task was successfully updated.' }
        format.json { render :show, status: :ok, location: task_sub_task_url(:task_id => @task.id, :id => @sub_task.id) }
      else
        format.html { render :edit }
        format.json { render json: @sub_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_tasks/1
  # DELETE /sub_tasks/1.json
  def destroy
    @task = Task.find_by_id(params[:task_id])
    @sub_task.destroy
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Sub task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_task
      @sub_task = SubTask.find(params[:id])
      @tasks = @tasks || Task.where(user_id: current_user.id)

      task = Task.find(params[:id]) if params[:id]
      if current_user.tasks.include? task
        @task = task
      elsif (params[:id] && !current_user.tasks.include?(task))
        flash[:notice] = "error accessing #{params[:id]}"
        redirect_to tasks_path
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_task_params
      params.require(:sub_task).permit(:id, :task_id, :title, :complete, :progress, :estimated_progress)
    end
end
