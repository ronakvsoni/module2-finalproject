class ProjectsController < ApplicationController

    before_action :find_project, only: [:show, :edit, :destroy]

    def new
        @project = Project.new  
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            session[:project_id] = @project.id
            redirect_to @admin
        else
            flash[:message] = @project.errors.full_messages
            render 'new'
        end
    end

    def edit

    end

    def show   

    end

    def index
        @projects = Project.all
    end

    def destroy 
        @project.delete
        flash[:message] = "Project Deleted"
        redirect_to @admin
    end

private

    def project_params
        params.require(:project).permit(:name, :description, :admin_id, :team_id)
    end

    def find_project
        @project = Project.find(params[:id])
    end

    def get_all_project_tasks
        @tasks = Task.find_all { |task| task.project_id == @project_id}
    end

end