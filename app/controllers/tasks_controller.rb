class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    if user_signed_in?
      @task = current_user.tasks.build
    end
    @today_tasks = Task.where("user_id = ?", current_user).where("duedate = ?", Date.today)
    @task_time = 0
    @day_time_assign = 900
    @importance_options = ["low", "medium", "high"]
  end

  def show
    @total_time = 0
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    @editpage = true;
    @dates = 1..31
    @importance_options = ["low", "medium", "high"]
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_path, notice: "Task was successfully created"
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task was successfully updated'
    else 
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to root_path, notice: "Not authorized to edit this task" if @task.nil?
    end

    def task_params
      params.require(:task).permit(:name, :time, :duedate, :importance
        )
    end
end
