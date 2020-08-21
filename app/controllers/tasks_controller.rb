class TasksController < ApplicationController

    before_action :find_task, only: [:show, :edit, :destroy]

    def new
        @task = Task.new  
    end

    def create
        @task = Task.new(task_params)
        if @task
            session[:team_id] = @team.id
            redirect_to @team
        else
            flash[:message] = @team.errors.full_messages
            render 'new'
        end
    end

    def edit
    end

    def show   
    end

    def destroy 
        @task.delete
        flash[:message] = "Successfully Deleted Task"
        redirect_to @project
    end

private

    def task_params
        params.require(:task).permit(:name, :project_id, :team_member_id)
    end

    def find_task
        @task = Task.find(params[:id])
    end

end