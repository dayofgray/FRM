class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]

    def new
        if !logged_in?
          @user = User.new
        else
            redirect_to root_path, alert: "Already logged in"
        end
    end

    def create
        if @user = User.find_by(email: params[:user][:email])
            if @user.authenticate(params[:user][:password])
                login(@user)
                redirect_to root_path
            else
                render 'new'
            end
        else
            render 'new'
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

end
