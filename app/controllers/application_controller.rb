class ApplicationController < ActionController::Base

    def current_admin
        @current_admin ||= Admin.find_by(id: session[:admin_id])
      end
    
      def logged_in?
        !!current_admin
      end
    
      def authorized
        redirect_to home_path if !logged_in?
      end

    
end
