class ApplicationController < ActionController::Base
    helper_method :curent_user,:logged_in?
    def curent_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!curent_user
    end
    def require_user
        if !logged_in?
            flash[:alert]="You must be logged in to perform this operation"
            redirect_to login_path
        end
    end
end
