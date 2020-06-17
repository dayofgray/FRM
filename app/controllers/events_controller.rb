class EventsController < ApplicationController

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to user_event_path(@event.user, @event)
        else
            @user = @event.user
            render '/users/show'
        end

    end


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

    private

    def event_params
        params.require(:event).permit(
            :location,
            :title,
            :event_time,
            :user_id,
            :friend_id
        )
    end

end