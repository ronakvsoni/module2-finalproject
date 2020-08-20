class SessionsController < ApplicationController

	before_action :authorized, except: [:new, :create]
	before_action :current_admin, except: [:new, :create]
	
	def new
	end

	def create
		# here we need to sign the user in
		@admin = Admin.find_by(username: params[:username])

		if @admin && @admin.authenticate(params[:password])
			# success
			session[:admin_id] == @admin.id
			redirect_to @admin
		else
			# error
			# user typed in wrong password, username doesn't exist
			# todo: add specific error messages
			if @admin == nil
				flash[:message] = "Admin could not be found."
			else
				flash[:message] = "Wrong password."
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

