class FriendsController < ApplicationController


    def new
        @friend = current_user.friends.build
    end
    
    def create
        @friend = Friend.new(friend_params)
        if @friend.save
            @uf = UserFriend.create(friend_id: @friend.id, user_id: current_user.id)
            redirect_to user_path(current_user)
        end
        render :new
    end

    def show
        @friend = Friend.find(params[:id])
    end

    def edit
        @friend = Friend.find(params[:id])
    end

    def update
        @friend = Friend.find_by(id: params[:id])
        if current_user.friends.include?(@friend)
         if @friend.update(friend_params)
            redirect_to friend_path(@friend)
         else
            render :edit
         end
        else
            render :edit
        end
    end

    def index
        @friends = current_user.friends
    end

    def destroy
        @friend = Friend.find(params[:id])
        if current_user.friends.include?(@friend)
            @friend.destroy
            redirect_to user_path(current_user)
        else
            render :show, notice: "Cannot delete"
        end
    end

    private

    def friend_params
        params.require(:friend).permit(
            :first_name,
            :last_name,
            :phone,
            :email,
            :birthday_month,
            :birthday_day
        )
    end

end