class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def start
      @task = Task.find(params[:id])
      @task.status = :in_progress
      @task.timer.start
      @task.save
      redirect_to @task.project
    end
  
    def stop
      @task = Task.find(params[:id])
      @task.status = :pending
      @task.timer.stop
      @task.save
      redirect_to @task.project
    end


    def index
      @tasks = Task.all
      # @project = Task.where(project_id: @project.id)
    end
  
    def show
    end
  
    def new
      @task = Task.new
    end
  
    def edit
    end

    
    def create

      @task = Task.new(task_params)
      @task.status = :pending
      @task.time_elapsed = 0

      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
    end
  
    def update

      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    end
  
    private
      def set_task
        @task = Task.find(params[:id])
      end
  
      def task_params
        params.require(:task).permit(:name, :project_id, :status, :time_elapsed)
      end
  end