class TeamsController < ApplicationController
    
    before_action :find_team, only: [:show, :edit, :update, :destroy]

    def new
        @team = Team.new  
    end


    def create
        @team = Team.new(team_params)
        @team.admin_id = session[:admin_id]
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
        @teams = Team.all
    end

    def destroy 
        @team.delete
        flash[:message] = "Successfully Deleted Team"
        redirect_to @team
    end


private

    def team_params
        params.require(:team).permit(:name, :admin_id, :team_member_id)
    end

    def find_team
        @team = Team.find(params[:id])
    end

end
