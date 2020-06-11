class ApplicationController < ActionController::Base
    helper_method [:current_user, :login, :logged_in?]

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
end
