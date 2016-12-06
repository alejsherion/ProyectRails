class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    find_task
    if @task.nil?
      flash[:error] = "Can't find Task"
      redirect_to root_path
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      flash[:success] = "Task created. Ok"
      render 'new'
    end
  end

  def destroy
      find_task
      if @task.destroy
        flash[:success] = "Task destroyed. Ok"
      else
        flash[:error] = "Can't destroy the Task"
      end
      redirect_to tasks_path
  end

  def update
    find_task
    if @task.update(task_params)
      flash[:success] = "Task Updated. Ok"
      redirect_to tasks_path
    else
      flash[:error] = "Can't updated the Task"
      render 'edit'
    end
  end

  def show
    find_task
    if @task.nil?
      flash[:error] = "Can't find the Task"
      redirect_to root_path
    end
  end

private

  def find_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:create_date, :star_date, :end_date, :due_date, :title, :description, :priority)
  end
end
