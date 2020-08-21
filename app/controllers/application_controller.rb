class ApplicationController < ActionController::Base

  before_action :set_cache_headers

    def current_admin
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
    
    def logged_in?
      !!current_admin
    end
    
    def authorized
      redirect_to home_path if !logged_in?
    end

  private

    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store"
    end
end
