class EventsController < ApplicationController
    before_action :find_event, only: [:edit, :update, :show, :destroy]

    def new
        @event = current_user.events.build
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to user_event_path(@event.user, @event)
        else
            @user = @event.user
            render '/users/show'
        end

    end

    def edit
        @user = @event.user
        if @user != current_user
            redirect_to user_path(current_user), notice: "You cannot view details of events of another user"
        end
    end

    def update
        if current_user.events.include?(@event)
         if @event.update(event_params)
            redirect_to user_event_path(@event.user, @event)
         else
            render :edit
         end
        else
            render :edit
        end
    end


    def show
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

    def destroy
        @event.destroy if @event.user = current_user
        redirect_to user_path(current_user)
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

    def find_event
        @event = Event.find(params[:id])
    end

end