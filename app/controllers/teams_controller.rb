class TeamsController < ApplicationController
    
    before_action :find_team, only: [:show, :edit, :update, :destroy]

    def new
        @team = Team.new  
    end

    def create
        byebug
        @team = Team.new(team_params)
        if @team
            # session[:team_id] = @team.id
            redirect_to admin_path()
        else
            flash[:message] = @team.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        @team.update(team_params)
        flash[:message] = "Team Updated"
        redirect_to @admin
    end

    def index
        @teams = Team.all
    end

    def show   
    end

    def destroy 
        @team.delete
        flash[:message] = "Successfully Deleted Team"
        redirect_to @admin
    end

private

    def team_params
        params.require(:team).permit(:name, :admin_id, :team_member_id)
    end

    def find_team
        @team = Team.find(params[:id])
    end

end