module UsersHelper
    def show_add_event
        if current_user_viewing_self
            if @user.friends.any?
                render "users/add_event"
            else
                render "users/need_friend"
            end
        end
    end
end
