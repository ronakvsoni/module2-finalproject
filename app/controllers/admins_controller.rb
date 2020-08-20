class AdminsController < ApplicationController

    def new
        @admin=Admin.new  
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            session[:admin_id] = @admin.id
            redirect_to @admin
        else
            flash[:message] = @admin.errors.full_messages
            render 'new'
        end
    end

    def edit
        @admin = Admin.find(params[:id])
    end

    def show
        @admin = Admin.find(params[:id])
    end


    def index
        @admin = Admin.all
    end

    def destroy 
        redirect_to admin_path
    end

private

    def admin_params
        params.require(:admin).permit(:name,:username, :email, :position, :password, :password_confirmation)
    end

end