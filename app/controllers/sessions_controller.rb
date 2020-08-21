class SessionsController < ApplicationController

	before_action :authorized, except: [:new, :create]
	before_action :current_admin, except: [:new, :create]
	
	def new
	end

	def create

		@admin = Admin.find_by(username: params[:username])

		if @admin && @admin.authenticate(params[:password])
			session[:admin_id] == @admin.id
			# redirect_to @admin
			render template: 'admins/show'
		else

			if @admin == nil
				flash[:alert] = "Username not found."
			else
				flash[:alert] = "Incorrect password."
			end
			redirect_to home_path
		end
	end

	def destroy
		session.delete :admin_id #= nil
		flash[:message] = "Successfully logged out."
		redirect_to home_path
	end
end