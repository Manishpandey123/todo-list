class TasksController < ApplicationController
    before_action :set_task, only: [:name, :phone, :description]

    def index
        binding.pry
        @tasks = Task.all
    end

    def show
        binding.pry
        set_task
    end

    def new
        @tasks = Task.new
    end

    def edit
        set_task
    end

    def create
       @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def update
       set_task
        if @tasks.update(task_params)
            redirect_to tasks_path
        else
            render :edit
        end
    end

    def destroy
       set_task
        if @tasks.destroy
            redirect_to tasks_path
        end
    end

    private

    def set_task
        @tasks = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :phone, :description)
    end
end
