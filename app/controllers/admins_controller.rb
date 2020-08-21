class AdminsController < ApplicationController
    before_action :find_admin, only: [:show, :edit, :update, :destroy]

    def new
        @admin = Admin.new  
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
    end

    def update
		if @admin.update(admin_params)
			redirect_to @admin
		else
			render :edit
		end
	end


    def show
    end

    def index
        @admin = Admin.all
    end

    def destroy 
        @admin.delete
        flash[:message] = "Successfully Deleted Your Account."
        redirect_to home_path
    end

private

    def admin_params
        params.require(:admin).permit(:name,:username, :email, :position, :password, :password_confirmation)
    end

    def find_admin
        @admin = Admin.find(params[:id])
    end

end
