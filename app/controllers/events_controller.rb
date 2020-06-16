class EventsController < ApplicationController

    def show
        @event = Event.find(params[:id])
        if @event.user != current_user
            redirect_to user_path(current_user), notice: "You cannot view details of events of another user"
        end

    end

    def index
        @user = User.find(params[:user_id])
        if current_user == @user
            @events = @user.events
        else
            redirect_to user_path(@user), notice: "You cannot view events of another user"
        end
    end

end