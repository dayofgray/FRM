class SessionsController < ApplicationController

    def new
        @user = User.new
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
