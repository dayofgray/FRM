class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @event = @user.events.build
    end

    def edit

    end

    def update
        if @user == current_user && @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        if @user == current_user
            @user.destroy
            reset_session
            redirect_to root_path
        else
            render :show
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation
        )
    end

    def find_user
        @user = User.find(params[:id])
    end
end
