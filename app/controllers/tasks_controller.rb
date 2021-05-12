class TasksController < ApplicationController
    def index
        binding.pry
        @tasks = Task.all
    end

    def show
        binding.pry
        @tasks = Task.find(params[:id])
    end

    def new
        @tasks = Task.new
    end

    def edit
        @tasks = Task.find(params[:id])
    end

    def create
        task_param = params[:task]
        @task = Task.new(name: task_param[:name], phone: task_param[:phone], description:task_param[:description])
        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def update
        @task = Task.find(params[:id])
        task_param = params[:task]
        if @task.update(name: task_param[:name], phone: task_param[:phone], description: task_param[:description])
            redirect_to tasks_path
        else
            render :edit
        end
    end

    def destroy
        @tasks = Task.find(params[:id])
        if @tasks.destroy
            redirect_to tasks_path
        end
    end
end
