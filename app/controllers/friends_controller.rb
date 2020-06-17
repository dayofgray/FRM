class FriendsController < ApplicationController

    def show

    end

    def new
        @friend = current_user.friends.build
    end

    def create
        @friend = Friend.new(friend_params)

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