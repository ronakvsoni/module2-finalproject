class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :edit, :update, :destroy]

    def new
        @admin=Admin.new  
    end

    def create
        @team = Team.new(team_params)
        if @team.save
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


    def index
        @team = Team.all
    end

    def destroy 
        @team.delete
        flash[:message] = "Successfully Deleted Team"
        redirect_to show_team_path
    end

private

    def team_params
        params.require(:team).permit(:admin_ids, :team_member_ids)
    end

    def find_team
        @team = Team.find(params[:id])
    end

end
