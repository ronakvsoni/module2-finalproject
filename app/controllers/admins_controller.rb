class AdminsController < ApplicationController

    def new
        @admin=Admin.new  
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            session[:user_id] = @admin.id
            redirect_to @admin
        else
            flash[:message] = @admin.errors.full_messages
            render 'new'
        end
    end

    def edit
        @Admin = Admin.find(params[:id])
    end

    def show
        @Admin = Admin.find(params[:id])
    end


    def index
        
    end

private

    def admin_params
        params.require(:admin).permit(:name,:username, :email, :position, :password, :password_confirmation)
    end

end