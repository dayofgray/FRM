module FriendsHelper
    def display_friends(user)
        @friends = user.friends
        if logged_in? && current_user == user
            render partial: "detailed_friends", locals: {user: user, friends: @friends}
        else
            render partial: "basic_friends", locals: {friends: @friends}
        end
    end
end