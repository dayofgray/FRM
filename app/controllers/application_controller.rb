class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method [:current_user, :login, :logged_in?, :current_user_viewing_self]

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def login(user)
        session[:user_id] = user.id
    end

    def logged_in?
        !current_user.nil?
    end

    def authenticate_user!
        if current_user.nil?
            redirect_to root_path, notice: "You must be logged in to utilize the FRM"
        end
    end

    def current_user_viewing_self
        @current_user == @user
    end
end
