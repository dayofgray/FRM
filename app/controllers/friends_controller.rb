class FriendsController < ApplicationController
    before_action :find_friend, only: [:edit, :update, :show, :destroy]


    def new
        @friend = current_user.friends.build
    end
    
    def create
        @friend = Friend.new(friend_params)
        if @friend.save
            @uf = UserFriend.create(friend_id: @friend.id, user_id: current_user.id)
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
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

    def destroy
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

    def find_friend
        @friend = Friend.find(params[:id])
    end

end