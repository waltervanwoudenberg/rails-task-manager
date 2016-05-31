class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index           # GET /tasks
    @tasks = Task.all
  end

  def show          # GET /tasks/:id
    # @task = Task.find(params[:id])
  end

  def new           # GET /tasks/new
    @task = Task.new
  end

  def create        # POST /tasks
    @task_params = task_params
    @task_params[:priority] = @task_params[:priority].to_i
    @task = Task.new(@task_params)
    @task.save!
    # no need for app/views/restaurants/create.html.erb
    redirect_to task_path(@task)
  end

  def edit          # GET /tasks/:id/edit
    # @task = Task.find(params[:id])
  end

  def update        # PATCH /tasks/:id
    # @task = Task.find(params[:id])
    @task_params = task_params
    @task_params[:priority] = @task_params[:priority].to_i
    @task.update(@task_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy       # DELETE /tasks/:id
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
    params.require(:task).permit(:name, :priority, :completed)
  end

end
